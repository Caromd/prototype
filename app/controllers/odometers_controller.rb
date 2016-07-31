class OdometersController < ApplicationController
  before_action :set_odometer, only: [:show, :edit, :update, :destroy]
  before_action :get_contracts, only: [:new, :edit]

  def index
    @q = Odometer.ransack(params[:q])
    @odometers = @q.result.includes(:contract)
  end

  def new
    @odometer = Odometer.new
  end

  def edit
  end

  def create
    @odometer = Odometer.new(odometer_params)

    respond_to do |format|
      if @odometer.save
        format.html { redirect_to odometers_path, notice: 'Odometer was successfully created.' }
        format.json { render :index, status: :created, location: @odometer }
      else
        format.html { render :new }
        format.json { render json: @odometer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @odometer.update(odometer_params)
        format.html { redirect_to odometers_path, notice: 'Odometer was successfully updated.' }
        format.json { render :index, status: :ok, location: @odometer }
      else
        format.html { render :edit }
        format.json { render json: @odometer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @odometer.destroy
    respond_to do |format|
      format.html { redirect_to odometers_url, notice: 'Odometer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_odometer
      @odometer = Odometer.find(params[:id])
    end
    
    def get_contracts
      @contracts = Contract.all
    end
    
    def odometer_params
      params.require(:odometer).permit(:user_id, :contract_id, :odometer_date, :odometer_reading)
    end
end