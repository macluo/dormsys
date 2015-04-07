class TerminationRequestsController < ApplicationController
  before_action :set_termination_request, only: [:show, :edit, :update, :destroy]

  # GET /termination_requests
  # GET /termination_requests.json
  def index
    permission_denied if !is_adm?
    @termination_requests = TerminationRequest.all
  end

  # GET /termination_requests/1
  # GET /termination_requests/1.json
  def show
    if (is_student?)
      redirect_to menu_student_url if !has_pending_request?
      @person = Person.find_by_pid(session[:pid])
      @student = Student.find_by_sid(session[:pid])
      request = TerminationRequest.where("sid = :student_id AND app_status <= 1", {student_id: current_user_id}).first
      if !request
        flash.now.alert = 'No pending request is found'
        #redirect_to menu_student_url
      end
    elsif (is_adm?)
      request = TerminationRequest.find_by_req_no(params[:id])
      @person = Person.find_by_pid(request.sid)
      @student = Student.find_by_sid(request.sid)
      @lease_no = get_active_lease(request.sid).lease_no
      if !request
        flash.now.alert = 'No pending request is found'
        #redirect_to menu_student_url
      end
    end
    @termination_request = request
  end

  # GET /termination_requests/new
  def new
    redirect_to menu_student_url if has_pending_request? || !has_active_lease?
    @person = Person.find_by_pid(session[:pid])
    @student= Student.find_by_sid(session[:pid])
    lease = SignedLease.getCurrentLease(session[:pid])

    if lease
      @termination_request = TerminationRequest.new
    else
      flash.now.alert = 'No active lease is found.'
      redirect_to menu_student_url
    end

  end

  # GET /termination_requests/1/edit
  def edit
  end

  # POST /termination_requests
  # POST /termination_requests.json
  def create
    @termination_request = TerminationRequest.new(termination_request_params)

    respond_to do |format|
      if @termination_request.save
        format.html { redirect_to @termination_request, notice: 'Termination request was successfully created.' }
        format.json { render :show, status: :created, location: @termination_request }
      else
        format.html { render :new }
        format.json { render json: @termination_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /termination_requests/1
  # PATCH/PUT /termination_requests/1.json
  def update
    respond_to do |format|
      if @termination_request.update(termination_request_params)
        format.html { redirect_to @termination_request, notice: 'Termination request was successfully updated.' }
        format.json { render :show, status: :ok, location: @termination_request }
      else
        format.html { render :edit }
        format.json { render json: @termination_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /termination_requests/1
  # DELETE /termination_requests/1.json
  def destroy
    @termination_request.destroy
    respond_to do |format|
      format.html { redirect_to termination_requests_url, notice: 'Termination request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_termination_request
      @termination_request = TerminationRequest.find(params[:id])
    end

    def has_pending_request?
      request = TerminationRequest.where("sid = :student_id AND app_status <= 1", {student_id: current_user_id}) # pending or reviewing
      if request.count > 0
        return true
      else
        return false
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def termination_request_params
      params[:termination_request].permit! #allow all parameters for now
    end
end
