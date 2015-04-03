class ParkingRequestsController < ApplicationController
  before_action :set_parking_request, only: [:show, :edit, :update, :destroy]

  # GET /parking_requests
  # GET /parking_requests.json
  def index
    @parking_requests = ParkingRequest.all
  end

  # GET /parking_requests/1
  # GET /parking_requests/1.json
  def show
    redirect_to menu_student_url if !has_pending_request?
    request = ParkingRequest.find_by_sid(session[:pid])
    if !request
      flash.now.alert = 'No pending request is found'
      #redirect_to menu_student_url
    end
  end

  # GET /parking_requests/new
  def new
    redirect_to menu_student_url if has_pending_request? || !has_active_lease?
    @parking_request = ParkingRequest.new
    @student= Student.find_by_sid(session[:pid])
  end

  # GET /parking_requests/1/edit
  def edit
  end

  # POST /parking_requests
  # POST /parking_requests.json
  def create
    @parking_request = ParkingRequest.new(parking_request_params)
    @parking_request.sid = current_user_id
    @parking_request.app_status = 0 #set pending flag

    respond_to do |format|
      if @parking_request.save
        format.html { redirect_to @parking_request, notice: 'Parking request was successfully created.' }
        format.json { render :show, status: :created, location: @parking_request }
      else
        format.html { render :new }
        format.json { render json: @parking_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parking_requests/1
  # PATCH/PUT /parking_requests/1.json
  def update
    respond_to do |format|
      if @parking_request.update(parking_request_params)
        format.html { redirect_to @parking_request, notice: 'Parking request was successfully updated.' }
        format.json { render :show, status: :ok, location: @parking_request }
      else
        format.html { render :edit }
        format.json { render json: @parking_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parking_requests/1
  # DELETE /parking_requests/1.json
  def destroy
    @parking_request.destroy
    respond_to do |format|
      format.html { redirect_to parking_requests_url, notice: 'Parking request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parking_request
      #@parking_request = ParkingRequest.find(params[:id])
    end

    def has_pending_request?
      request = ParkingRequest.where("sid = :student_id AND app_status <= 1", {student_id: current_user_id}) # pending or reviewing
      if request.count > 0
        return true
      else
        return false
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parking_request_params
      params[:parking_request].permit! #allow all parameters for now
    end

    def has_active_lease?
      true
    end
end