class InvoicesController < ApplicationController
  before_action :set_invoice, only: [ :edit, :update, :destroy]

  # GET /invoices
  # GET /invoices.json
  def index
    if is_adm?
      @invoices = Invoice.all
    else
      @invoices = Invoice.where("sid = ? AND bill_end_date < ?", current_user_id, Time.now)
    end
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
    if is_adm?
      @invoice = Invoice.find_by_inv_no(params[:id])
      return redirect_to menu_staff_url if @signed_lease.nil?
    else
      return redirect_to menu_student_url if !has_active_lease?
      @invoice = Invoice.where("sid = ? AND bill_end_date >= ?", current_user_id, Time.now)
      @signed_lease = get_active_lease

      if (@invoice.count == 0) #need to create new invoice

        @invoice = Invoice.new({:sid => current_user_id, :lease_no => @signed_lease.lease_no})

        if (@signed_lease.pay_option == 1) ## monthly

          @invoice.bill_start_date = Date.new(Time.now.year, Time.now.month, 1)
          @invoice.bill_end_date = Date.today.end_of_month
          @invoice.payment_due = @signed_lease.rent
          @invoice.duedate = Date.today.end_of_month

        else  # by semester

          case current_semester
            when 1
              @invoice.bill_start_date = spring_start_date
              @invoice.bill_end_date = spring_end_date
              @invoice.payment_due = 5*@signed_lease.rent
              @inovice.duedate = spring_start_date + 30.day
            when 2
              @invoice.bill_start_date = summer_start_date
              @invoice.bill_end_date = summer_end_date
              @invoice.payment_due = 2*@signed_lease.rent
              @inovice.duedate = summer_start_date + 30.day
            when 3
              @inovice.bill_start_date = fall_start_date
              @inovice.bill_end_date = fall_end_date
              @invoice.payment_due = 5*@signed_lease.rent
              @inovice.duedate = fall_start_date + 30.day
          end

        end

        if !@invoice.save
          return redirect_to menu_student_url #something is wrong!
        end

      else
        @invoice = @invoice.first #because it is in an array
      end
    end
    @person = Person.find_by_pid(@signed_lease.sid)
  end

  # GET /invoices/new
  def new
    @person = Person.new # for now
    @person.build_student #for now
    @signed_lease = SignedLease.new #for now
    @invoice = Invoice.new
  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params[:invoice]
    end
end
