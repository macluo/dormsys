class HousingRequestsController < ApplicationController
  before_action :set_housing_request, only: [:show, :edit, :update, :destroy]

  # GET /housing_requests
  # GET /housing_requests.json
  def index
    @housing_requests = HousingRequest.all
  end

  # GET /housing_requests/1
  # GET /housing_requests/1.json
  def show
  end

  # GET /housing_requests/new
  def new
    @person = Person.new #for now
    @person.build_student #for now
    @housing_request = HousingRequest.new
  end

  # GET /housing_requests/1/edit
  def edit
  end

  # POST /housing_requests
  # POST /housing_requests.json
  def create
    @housing_request = HousingRequest.new(housing_request_params)

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
      @housing_request = HousingRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def housing_request_params
      params[:housing_request]
    end
end
