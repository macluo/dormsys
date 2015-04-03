class MaintenanceRequestsController < ApplicationController
  before_action :set_maintenance_request, only: [:show, :edit, :update, :destroy]

  # GET /maintenance_requests
  # GET /maintenance_requests.json
  def index
    permission_denied if !is_adm?
    @maintenance_requests = MaintenanceRequest.all
  end

  # GET /maintenance_requests/1
  # GET /maintenance_requests/1.json
  def show
    redirect_to menu_student_url if !has_pending_request?
    request = MaintenanceRequest.find_by_sid(session[:pid])
    if !request
      flash.now.alert = 'No pending request is found'
      #redirect_to menu_student_url
    end
  end

  # GET /maintenance_requests/new
  def new
    redirect_to menu_student_url if has_pending_request? || !has_active_lease?
    @maintenance_request = MaintenanceRequest.new
  end

  # GET /maintenance_requests/1/edit
  def edit
  end

  # POST /maintenance_requests
  # POST /maintenance_requests.json
  def create
    @maintenance_request = MaintenanceRequest.new(maintenance_request_params)
    @maintenance_request.sid = current_user_id
    @maintenance_request.app_status = 0 #set pending flag

    respond_to do |format|
      if @maintenance_request.save
        format.html { redirect_to @maintenance_request, notice: 'Maintenance request was successfully created.' }
        format.json { render :show, status: :created, location: @maintenance_request }
      else
        format.html { render :new }
        format.json { render json: @maintenance_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maintenance_requests/1
  # PATCH/PUT /maintenance_requests/1.json
  def update
    respond_to do |format|
      if @maintenance_request.update(maintenance_request_params)
        format.html { redirect_to @maintenance_request, notice: 'Maintenance request was successfully updated.' }
        format.json { render :show, status: :ok, location: @maintenance_request }
      else
        format.html { render :edit }
        format.json { render json: @maintenance_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maintenance_requests/1
  # DELETE /maintenance_requests/1.json
  def destroy
    @maintenance_request.destroy
    respond_to do |format|
      format.html { redirect_to maintenance_requests_url, notice: 'Maintenance request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maintenance_request
      #@maintenance_request = MaintenanceRequest.find(params[:id])
    end

    def has_pending_request?
      request = MaintenanceRequest.where("sid = :student_id AND app_status <= 1", {student_id: current_user_id}) # pending or reviewing
      if request.count > 0
        return true
      else
        return false
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def maintenance_request_params
      params[:maintenance_request].permit! #allow all parameters for now
    end

    def has_active_lease?
      true
    end
end
