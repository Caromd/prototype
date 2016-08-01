class AssetsController < ApplicationController
  before_action :set_asset, only: [:show, :edit, :update, :destroy]
  before_action :get_owners, only: [:new, :edit]
  before_action :authenticate_user!

  def index
    @q = Asset.ransack(params[:q])
    @assets = @q.result.includes(:owner).order(id: 'desc')
  end

  def new
    @asset = Asset.new
  end

  def edit
  end

  def create
    @asset = Asset.new(asset_params)

    respond_to do |format|
      if @asset.save
        format.html { redirect_to assets_path, notice: 'Asset was successfully created.' }
        format.json { render :index, status: :created, location: @asset }
      else
        format.html { render :new }
        format.json { render json: @asset.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @asset.update(asset_params)
        format.html { redirect_to assets_path, notice: 'Asset was successfully updated.' }
        format.json { render :index, status: :ok, location: @asset }
      else
        format.html { render :edit }
        format.json { render json: @asset.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @asset.destroy
    respond_to do |format|
      format.html { redirect_to assets_url, notice: 'Asset was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_asset
      @asset = Asset.find(params[:id])
    end

    def get_owners
      @owners = Owner.all
    end

    def asset_params
      params.require(:asset).permit(:user_id, :owner_id, :make, :model, :first_registration_date, :colour, :registration_number, :vin_number, :engine_number, :purchase_price, :date_of_purchase,
      :status, 
      :full_service_history, 
      :rental_date_available_to, 
      :rental_date_available_from, 
      :service_intervals, 
      :warranty, 
      :warranty_start_date, 
      :warranty_end_date, 
      :warranty_km, 
      :service_plan, 
      :service_plan_start_date, 
      :service_plan_end_date, 
      :service_plan_km, 
      :insurer, 
      :policy_number, 
      :roadside_assistance_provider, 
      :roadside_assistance_number, 
      :date_loaded_on_system, 
      :vehicle_license_expiry_date, 
      :date_of_next_service, 
      :km_next_service, 
      :date_of_last_service, 
      :etag, 
      :etag_number)
    end
end