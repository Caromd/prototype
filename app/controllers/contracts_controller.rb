class ContractsController < ApplicationController
  before_action :set_contract, only: [:show, :edit, :update, :destroy]
  before_action :get_renters, only: [:new, :edit]
  before_action :get_assets, only: [:new, :edit]
  before_action :get_statuses, only: [:new, :edit]
  before_action :authenticate_user!

  def index
    @q = Contract.ransack(params[:q])
    @contracts = @q.result.includes(:asset)
#    @search.build_condition if @search.conditions.empty?
#    @search.build_sort if @search.sorts.empty?
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
    
    def get_renters
      @renters = Renter.all
    end
    
    def get_statuses
      @statuses = ["Active","Inactive"]
    end
    
    def get_assets
      @assets = Asset.all
    end


    def contract_params
      params.require(:contract).permit(:user_id ,:asset_id, :renter_id, :status, :type_of_contract, :monthly_rental_rate, :collection_date, :term, :monthly_km_allowance)
    end
end