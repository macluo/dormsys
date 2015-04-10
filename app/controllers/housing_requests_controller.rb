class HousingRequestsController < ApplicationController
  before_action :set_housing_request, only: [:show, :edit, :update, :destroy]

  # GET /housing_requests
  # GET /housing_requests.json
  def index
    permission_denied if !is_adm?
    @housing_requests = HousingRequest.where("app_status = 0") # pending cases
  end

  # GET /housing_requests/1
  # GET /housing_requests/1.json
  def show
    if (is_student?)
      redirect_to menu_student_url if !has_pending_request?
      @person = Person.find_by_pid(session[:pid])
      @student = Student.find_by_sid(session[:pid])
      request = HousingRequest.find_by_sid(session[:pid])
      if !request
        flash.now.alert = 'No pending request is found'
        #redirect_to menu_student_url
      end
    elsif (is_adm?)
      request = HousingRequest.find_by_req_no(params[:id])
      @person = Person.find_by_pid(request.sid)
      @student = Student.find_by_sid(request.sid)
      if !request
        flash.now.alert = 'No pending request is found'
        #redirect_to menu_student_url
      end
    end
    @housing_request = request
  end

  # GET /housing_requests/new
  def new
    redirect_to menu_student_url if has_pending_request? || has_active_lease?
    @person = Person.find_by_pid(session[:pid])
    @student= Student.find_by_sid(session[:pid])
    @nearby_parking = ParkingLot.select(:lot_no)

    if @student.family_student == true
      @pref_housing = BuildingsApt.select(:unit_no)
      @select_item = "unit_no"
    elsif @student.category == 'Graduate'
      @pref_housing = BuildingsApt.where("category < 3 and upper_class = 1" ).select(:unit_no)
      @select_item = "unit_no"
    elsif @student.category == 'Freshman'
      @pref_housing = BuildingsApt.where("category < 3 and unit_no <> 'Slytherin Hall'").select(:unit_no)
      @select_item = "unit_no"
    else # if not specified then treat students as single student
      @pref_housing = BuildingsApt.where("category < 3").select(:unit_no)
      @select_item = "unit_no"
    end

    @housing_request = HousingRequest.new
  end

  # GET /housing_requests/1/edit
  def edit
  end

  # POST /housing_requests
  # POST /housing_requests.json
  def create
    #housing_request_params.merge!({:sid => session[:pid]})
    @housing_request = HousingRequest.new(housing_request_params)
    @housing_request.app_status = 0; #set pending flag
    @housing_request.sid = current_user_id

    respond_to do |format|
      if @housing_request.save
        format.html { redirect_to @housing_request, notice: 'Housing request was successfully created.' }
        format.json { render :show, status: :created, location: @housing_request }
      else
        format.html { render :new }
        format.json { render json: @housing_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /housing_requests/1
  # PATCH/PUT /housing_requests/1.json
  def update
    respond_to do |format|
      if @housing_request.update(housing_request_params)
        format.html { redirect_to @housing_request, notice: 'Housing request was successfully updated.' }
        format.json { render :show, status: :ok, location: @housing_request }
      else
        format.html { render :edit }
        format.json { render json: @housing_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /housing_requests/1
  # DELETE /housing_requests/1.json
  def destroy
    @housing_request.destroy
    respond_to do |format|
      format.html { redirect_to housing_requests_url, notice: 'Housing request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_housing_request
      #@housing_request = HousingRequest.find(params[:id])
    end

    def has_pending_request?
      request = HousingRequest.where("sid = :student_id AND app_status <= 1", {student_id: current_user_id}) # pending or reviewing
      if request.count > 0
        return true
      else
        return false
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def housing_request_params
      params[:housing_request].permit! #allow all parameters for now
    end
end
