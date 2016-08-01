class ContractsController < ApplicationController
  before_action :set_contract, only: [:show, :edit, :update, :destroy]
  before_action :get_dropdowns, only: [:new, :edit]
  before_action :authenticate_user!

  def index
    @q = Contract.ransack(params[:q])
    @contracts = @q.result.includes(:asset).order(id: 'desc')
  end

  def new
    @contract = Contract.new
  end

  def edit
  end

  def create
    @contract = Contract.new(contract_params)

    respond_to do |format|
      if @contract.save
        format.html { redirect_to contracts_path, notice: 'Contract was successfully created.' }
        format.json { render :index, status: :created, location: @contract }
      else
        format.html { render :new }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @contract.update(contract_params)
        format.html { redirect_to contracts_path, notice: 'Contract was successfully updated.' }
        format.json { render :index, status: :ok, location: @contract }
      else
        format.html { render :edit }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @contract.destroy
    respond_to do |format|
      format.html { redirect_to contracts_url, notice: 'Contract was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_contract
      @contract = Contract.find(params[:id])
    end
    
    def get_dropdowns
      @renters = Renter.all
      @statuses = ["Active","Inactive"]
      @assets = Asset.all
      @types_of_contract = ["Managed","Collection Only"]
      @payment_methods = ["Credit Card","EFT","Debit Order","Cash"]
    end


    def contract_params
      params.require(:contract).permit(:user_id ,:asset_id, :renter_id, :status, :type_of_contract, :monthly_rental_rate, :collection_date, :term, :monthly_km_allowance, :return_date, :initial_odometer_reading, :daily_km_allowance, :payment_day, :payment_method, :additional_drivers, :deposit_sum_held, :deposit_at_risk, :late_payment_flag)
    end
end