class SignedLeasesController < ApplicationController
  #before_action :set_signed_lease, only: [:show, :edit, :update, :destroy]
  before_action :check_permission, only: [:index, :new, :create, :edit, :update]

  # GET /signed_leases
  # GET /signed_leases.json
  def index
    permission_denied if !is_adm?
    @signed_leases = SignedLease.all
  end

  # GET /signed_leases/1
  # GET /signed_leases/1.json
  def show
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

      the_apt = FamilyApt.where(:apt_no => idx, :lease_no => nil).first
      @signed_lease.place_no = the_apt.apt_no;
      @signed_lease.rent = the_apt.rent

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

      the_room = Room.where(:unit_no => idx, :lease_no => nil).first
      @signed_lease.place_no = the_room.place_no;
      @signed_lease.rent = the_room.rent

    end

    @signed_lease.sid = @student.sid
    @signed_lease.start_sem = current_semester
    @signed_lease.end_sem = current_semester + request.period - 1
    @signed_lease.pay_option = request.pay_option

  end

  # GET /signed_leases/1/edit
  def edit
  end

  # POST /signed_leases
  # POST /signed_leases.json
  def create
    @signed_lease = SignedLease.new(signed_lease_params)

    respond_to do |format|
      if @signed_lease.save



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
    respond_to do |format|
      if @signed_lease.update(signed_lease_params)
        format.html { redirect_to @signed_lease, notice: 'Signed lease was successfully updated.' }
        format.json { render :show, status: :ok, location: @signed_lease }
      else
        format.html { render :edit }
        format.json { render json: @signed_lease.errors, status: :unprocessable_entity }
      end
    end
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
