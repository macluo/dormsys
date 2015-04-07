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
      redirect_to menu_staff_url if @signed_lease.count = 0
    else
      @signed_lease = SignedLease.where("sid = ? AND end_sem <= ?", current_user_id, current_semester)
      redirect_to menu_student_url if @signed_lease.count == 0 #exit if no record
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
    if @student.s_type == 'family'
      puts "family"

      if !request.apt_pref_1.nil? && !the_list.index{ |x| x[:unit_no] == request.apt_pref_1}.nil?
        puts "dada"
        idx = request.apt_pref_1
      elsif !request.apt_pref_2.nil? && !the_list.index{ |x| x[:unit] == request.apt_pref_2}.nil?
        idx = request.apt_pref_2
      elsif !request.apt_pref_3.nil? && !the_list.index{ |x| x[:unit] == request.apt_pref_3}.nil?
        idx = request.apt_pref_3
      else # no vacant

      end

      the_apt = FamilyApt.where(:apt_no => idx, :occupant => nil).first
      @signed_lease.place_no = the_apt.apt_no;
      @signed_lease.rent = the_apt.rent
      @type = 'family'

    else

      if !request.building_pref_1.nil? && !the_list.index{ |x| x[:unit_no] == request.building_pref_1}.nil?
        puts "dada"
        idx = request.building_pref_1
      elsif !request.building_pref_2.nil? && !the_list.index{ |x| x[:unit] == request.building_pref_2}.nil?
        idx = request.building_pref_2
      elsif !request.building_pref_3.nil? && !the_list.index{ |x| x[:unit] == request.building_pref_3}.nil?
        idx = request.building_pref_3
      else # no vacant

      end

      the_room = Room.where(:unit_no => idx, :occupant => nil).first
      @signed_lease.place_no = the_room.place_no;
      @signed_lease.rent = the_room.rent
      @type = 'single'
    end

    @signed_lease.sid = @student.sid
    @signed_lease.start_sem = current_semester
    @signed_lease.end_sem = current_semester + request.period - 1
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
          room = Room.find_by_place_no(@signed_lease.place_no)
          room.occupant = request.sid # see if this works?
          room.save
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
      the_lease = get_active_lease(parking_request.sid);

      if (parking_request.pref_nearby == true)

        #find nearby housing first

        if the_lease.place_no.nil? #family student
          building_no = the_lease.apt_no
        else #single student
          building_no = Room.find_by_place_no(the_lease.place_no).unit_no
        end

        ParkingLot.all.each do |t|
          if JSON.parse(t.nearby_housing).include?(building_no)
              the_lot = t.lot_no
          end
          break if !the_lot.nil?
        end

        if (parking_request.is_disabled)  # disabled?
          ParkingSpot.where(:spot_no => the_lot, :occupant => nil).each do |t|
            if t.class_id == 5
              the_spot = t
              the_fee = ParkingClass.find_by_class_id(p.class_id).fee
            end
            break if !the_spot.nil?
          end

        else # not disabled!

          ParkingSpot.where(:spot_no => the_lot, :occupant => nil).each do |t|
            if t.class_id == parking_request.vehicle_type
              the_spot = t
              the_fee = ParkingClass.find_by_class_id(p.class_id).fee
            end
            break if !the_spot.nil?
          end

        end

      else # any parking is fine

        Room.where(:occupant => nil).each do |p|
          if (parking_request.is_disabled && p.class_id == 5)
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
