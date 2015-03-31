class SignedLeasesController < ApplicationController
  before_action :set_signed_lease, only: [:show, :edit, :update, :destroy]

  # GET /signed_leases
  # GET /signed_leases.json
  def index
    @signed_leases = SignedLease.all
  end

  # GET /signed_leases/1
  # GET /signed_leases/1.json
  def show
  end

  # GET /signed_leases/new
  def new
    @person = Person.new # new for now
    @person.build_student
    @signed_lease = SignedLease.new
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
      params[:signed_lease]
    end
end
