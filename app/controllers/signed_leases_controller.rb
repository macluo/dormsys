class SignedLeasesController < ApplicationController
  #before_action :set_signed_lease, only: [:show, :edit, :update, :destroy]
  before_action :check_permission, only: [:new, :create, :edit, :update]

  # GET /signed_leases
  # GET /signed_leases.json
  def index
    if is_adm?
      @signed_leases = SignedLease.all
    else
      @signed_leases = SignedLease.where(:sid => current_user_id)
    end

  end

  # GET /signed_leases/1
  # GET /signed_leases/1.json
  def show

    if is_adm?
      @signed_lease = SignedLease.find_by_lease_no(params[:id])
      return redirect_to menu_staff_url if @signed_lease.nil?
    else
      @signed_lease = SignedLease.where("sid = ? AND end_date >= ?", current_user_id, Time.now)
      return redirect_to menu_student_url if @signed_lease.count == 0 #exit if no record
      @signed_lease = @signed_lease.first #because it is in an array
    end

    @person = Person.find_by_pid(@signed_lease.sid)
  end

  # GET /signed_leases/new
  def new
    permission_denied if !is_adm?
    request = HousingRequest.find_by_req_no(signed_lease_params[:req_no])
    @person = Person.find_by_pid(request.sid) # new for now
    @student = Student.find_by_sid(request.sid)
    @signed_lease = SignedLease.new

    #match available housing
    the_list = housing_vacant_list #get this list from application controller

      if !request.building_pref_1.nil? && !the_list.index{ |x| x[:unit_no] == request.building_pref_1}.nil?
        idx = request.building_pref_1
      elsif !request.building_pref_2.nil? && !the_list.index{ |x| x[:unit] == request.building_pref_2}.nil?
        idx = request.building_pref_2
      elsif !request.building_pref_3.nil? && !the_list.index{ |x| x[:unit] == request.building_pref_3}.nil?
        idx = request.building_pref_3
      else # no vacant

      end

      category = BuildingsApt.find_by_unit_no(idx).category
      if category == 3 #family apts
        the_room = FamilyApt.where(:unit_no => idx, :occupant => nil).first;
        @signed_lease.apt_no = the_room.apt_no
        @signed_lease.rent = the_room.rent
        @type = 'family'
      else
        the_room = Room.where(:unit_no => idx, :occupant => nil)[0]  #can't use .first because of index error for superkey
        @signed_lease.place_no = the_room.place_no
        @signed_lease.rent = BuildingsApt.find_by_unit_no(idx).rent
        @type = 'single'
      end
      @signed_lease.unit_no = the_room.unit_no

    @signed_lease.sid = @student.sid
    @signed_lease.start_date = request.movein_date
    @signed_lease.end_date = current_semester_end_date
    @signed_lease.pay_option = request.pay_option

    @request_id = request.req_no #pass housing request req_no

  end

  # GET /signed_leases/1/edit
  def edit
  end

  # POST /signed_leases
  # POST /signed_leases.json
  def create
    # prevent ParkingSpot error
    signed_lease_params[:parking_spot] = nil if signed_lease_params[:parking_spot] == ''

    request = HousingRequest.find_by_req_no(params[:req_no])
    @signed_lease = SignedLease.new(signed_lease_params)
    @signed_lease.sid = request.sid

    #set some attributes to nil to avoid foreign key constraint errors

    if (params[:type] == 'single')
      @signed_lease.apt_no = nil
    else
      @signed_lease.place_no = nil
      @signed_lease.unit_no = nil
    end

    @signed_lease.parking_spot = nil if @signed_lease == ''
    @signed_lease.permit_id = nil if @signed_lease == ''

    respond_to do |format|
      if @signed_lease.save

        #change app_status on housing_requests after signed_lease has been created
        request.app_status = 2
        request.save

        #update to rooms or family apts
        if (params[:type] == 'single')
          # can't use update because of rooms has superkey!
          #room = Room.where(:place_no => @signed_lease.place_no, :unit_no =>@signed_lease.unit_no)
          #room.occupant = request.sid # see if this works?
          #room.save
          ActiveRecord::Base.connection.execute('update rooms set occupant = "#{request.sid}" where unit_no = "#{@signed_lease.unit_no}" and place_no = "#{@signed_lease.place_no}"')
        else
          family_apt = FamilyApt.find_by_apt_no(@signed_lease.apt_no)
          family_apt.occupant = request.sid
          family_apt.save
        end

        format.html { redirect_to @signed_lease, notice: 'Signed lease was successfully created.' }
        format.json { render :show, status: :created, location: @signed_lease }
      else
        format.html { render :new }
        format.json { render json: @signed_lease.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /signed_leases/1
  # PATCH/PUT /signed_leases/1.json
  def update

    if params[:type] == "approve_parking" # by staff
      parking_request = ParkingRequest.find_by_req_no(params[:id])
      the_lease = get_user_lease(parking_request.sid);

      # set up variables
      the_lot = nil
      the_fee = nil
      the_spot = nil

      if (parking_request.pref_nearby == true)

        #find nearby housing first

        building_no = the_lease.unit_no

        ParkingLot.all.each do |t|
          if t.nearby_housing == building_no
              the_lot = t.lot_no
          end
          break if !the_lot.nil?
        end

        if (parking_request.is_disabled)  # disabled?
          ParkingSpot.where(:lot_no => the_lot, :occupant => nil).each do |t|
            if t.class_id == 4
              the_spot = t
              the_fee = ParkingClass.find_by_class_id(t.class_id).fee
            end
            break if !the_spot.nil?
          end

        else # not disabled!

          ParkingSpot.where(:lot_no => the_lot, :occupant => nil).each do |t|
            if t.class_id == parking_request.vehicle_type
              the_spot = t
              the_fee = ParkingClass.find_by_class_id(t.class_id).fee
            end
            break if !the_spot.nil?
          end

        end

      elsif is_guest? #only general parking is allowed

        ParkingSpot.where(:lot_no => 7, :occupant => nil).each do |t|
          if t.class_id == parking_request.vehicle_type
            the_spot = t
            the_fee = ParkingClass.find_by_class_id(t.class_id).fee
          end
          break if !the_spot.nil?
        end

      else # any parking is fine

        ParkingSpot.where(:occupant => nil).each do |p|
          if (parking_request.is_disabled && p.class_id == 4)
            the_spot = p
            the_fee = ParkingClass.find_by_class_id(p.class_id).fee
          elsif (parking_request.vehicle_type == p.class_id)
            the_spot = p
            the_fee = ParkingClass.find_by_class_id(p.class_id).fee
          end
          break if !the_spot.nil?
        end

      end

      if the_spot.nil?
        # error message! no parking spot available
        redirect_to parking_request
        return
      end
      # update to signed lease

      if SignedLease.update(the_lease.lease_no, :parking_spot => the_spot.spot_no, :parking_fee => the_fee)

        the_spot.occupant = parking_request.sid
        the_spot.save

        parking_request.app_status = 2
        parking_request.save

        redirect_to parking_requests_url
        return
      else
        # something is wrong!!!!
      end

    elsif (params[:type] == "cancel_parking") # cancel parking

    end

    #respond_to do |format|
    #  if @signed_lease.update(signed_lease_params)
    #    format.html { redirect_to @signed_lease, notice: 'Signed lease was successfully updated.' }
    #    format.json { render :show, status: :ok, location: @signed_lease }
    #  else
    #    format.html { render :edit }
    #    format.json { render json: @signed_lease.errors, status: :unprocessable_entity }
    #  end
    #end
  end

  # DELETE /signed_leases/1
  # DELETE /signed_leases/1.json
  def destroy
    @signed_lease.destroy
    respond_to do |format|
      format.html { redirect_to signed_leases_url, notice: 'Signed lease was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_signed_lease
      @signed_lease = SignedLease.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def signed_lease_params
      params[:signed_lease].permit! #pass all parameters for now
    end

    def check_permission
      permission_denied if !is_adm?
    end
end
