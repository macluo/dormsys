class TerminationRequestsController < ApplicationController
  before_action :set_termination_request, only: [:show, :edit, :update, :destroy]

  # GET /termination_requests
  # GET /termination_requests.json
  def index
    @termination_requests = TerminationRequest.all
  end

  # GET /termination_requests/1
  # GET /termination_requests/1.json
  def show
  end

  # GET /termination_requests/new
  def new
    @person = Person.new # for now
    @person.build_student # for now
    @signed_lease = SignedLease.new # for now
    @termination_request = TerminationRequest.new
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def termination_request_params
      params[:termination_request]
    end
end
