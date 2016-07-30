class RentersController < ApplicationController
  before_action :set_renter, only: [:show, :edit, :update, :destroy]
  before_action :get_statuses, only: [:new, :edit]
  before_action :authenticate_user!

  def index
    @renters = Renter.all
  end

  def new
    @renter = Renter.new
  end

  def edit
  end

  def create
    @renter = Renter.new(renter_params)

    respond_to do |format|
      if @renter.save
        format.html { redirect_to renters_path, notice: 'Renter was successfully created.' }
        format.json { render :index, status: :created, location: @renter }
      else
        format.html { render :new }
        format.json { render json: @renter.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @renter.update(renter_params)
        format.html { redirect_to renters_path, notice: 'Renter was successfully updated.' }
        format.json { render :index, status: :ok, location: @renter }
      else
        format.html { render :edit }
        format.json { render json: @renter.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @renter.destroy
    respond_to do |format|
      format.html { redirect_to renters_url, notice: 'Renter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_renter
      @renter = Renter.find(params[:id])
    end

    def get_statuses
      @statuses = ["Active","Inactive"]
    end

    def renter_params
      params.require(:renter).permit(:user_id, :name, :surname, :id_number, :email, :drivers_licence)
    end
end