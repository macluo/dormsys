class TerminationRequestsController < ApplicationController
  before_action :set_termination_request, only: [:edit, :update, :destroy]

  # GET /termination_requests
  # GET /termination_requests.json
  def index
    permission_denied if !is_adm?
    @termination_requests = TerminationRequest.where("app_status = 0")
  end

  # GET /termination_requests/1
  # GET /termination_requests/1.json
  def show
    if (is_student?)
      return redirect_to menu_student_url if !has_pending_request? || !has_active_lease?
      request = TerminationRequest.where("lease_no = :lease_no AND app_status <= 1", {lease_no: get_active_lease.lease_no}).first
      @person = Person.find_by_pid(current_user_id)
      @student = Student.find_by_sid(current_user_id)
      @signed_lease = get_active_lease
      if !request
        flash.now.alert = 'No pending request is found'
        #redirect_to menu_student_url
      end
    elsif (is_adm?)
      request = TerminationRequest.find_by_t_req_no(params[:id])
      @signed_lease = SignedLease.find_by_lease_no(request.lease_no)
      @person = Person.find_by_pid(@signed_lease.sid)
      @student = Student.find_by_sid(@signed_lease.sid)
      @ticket_no = request.t_req_no
      if !request
        flash.now.alert = 'No pending request is found'
        #redirect_to menu_student_url
      end
    end
    @termination_request = request
  end

  # GET /termination_requests/new
  def new
    return redirect_to menu_student_url if !has_active_lease?
    return redirect_to termination_request_url(@request) if has_pending_request? #show termination content
    lease = get_active_lease

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
    @termination_request.lease_no = get_active_lease.lease_no
    @termination_request.app_status = 0 #set pending flag

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

    if is_adm? && params[:type] == 'terminate'
      request = TerminationRequest.find_by_t_req_no(termination_request_params[:ticket_no])
      the_lease = SignedLease.find_by_lease_no(request.lease_no)

      if the_lease.end_date > request.termination_date
        the_lease.end_date = request.termination_date

        #redo invoice
        diff = (the_lease.end_date - request.termination_date).to_i
        if diff < 30
          #remaining has to be paid, don't do anything
        elsif diff < 60
          invoice = get_current_invoice
          amount = (invoice.bill_end_date - request.termination_date).to_i/(invoice.bill_end_date - invoice.bill_start_date).to_i*0.6
          invoice.payment_due = amount
          invoice.save
        end

      end

      # redo removal when time comes

      the_lease.save
      request.app_status = 2
      request.save

      redirect_to termination_requests_url
      return
    else
      @termination_request = TerminationRequest.find(params[:id])
    end

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
      @lease = get_active_lease
      request = TerminationRequest.where("lease_no = :lease_no AND app_status <= 1", {lease_no: get_active_lease.lease_no}) # pending or reviewing
      if request.count > 0
        @request = request[0]
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
