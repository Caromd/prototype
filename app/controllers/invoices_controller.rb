class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]
  before_action :get_contracts, only: [:new, :edit]

  def index
    @q = Invoice.ransack(params[:q])
    @invoices = @q.result.includes(:contract).order(id: 'desc')
  end

  def new
    @invoice = Invoice.new   
    6.times do
      @line = @invoice.lines.build
    end
  end

  def edit
    3.times do
      @line = @invoice.lines.build
    end
  end

  def create
    @invoice = Invoice.new(invoice_params)

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to invoices_path, notice: 'Invoice was successfully created.' }
        format.json { render :index, status: :created, location: @invoice }
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to invoices_path, notice: 'Invoice was successfully updated.' }
        format.json { render :index, status: :ok, location: @invoice }
      else
        format.html { render :edit }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end
    
    def get_contracts
      @contracts = Contract.all
    end
    
    def invoice_params
      params.require(:invoice).permit(:user_id, :contract_id, :invoice_date, :invoice_number, :comments,
      lines_attributes: [:id, :user_id, :line_type_id, :amount, :_destroy])
    end
end