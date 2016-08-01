class RentersController < ApplicationController
  before_action :set_renter, only: [:show, :edit, :update, :destroy]
  before_action :get_dropdowns, only: [:new, :edit]
  before_action :authenticate_user!

  def index
    @q = Renter.ransack(params[:q])
    @renters = @q.result.order(id: 'desc')
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

    def get_dropdowns
      @statuses = ["Active","Inactive"]
      @provinces = ["Western Cape","Other"]
      @payment_methods = ["Credit Card","EFT","Debit Order","Cash"]
    end

    def renter_params
      params.require(:renter).permit(:user_id, :name, :surname, :id_number, :email, :drivers_licence, :residential_address1, :residential_address2, :suburb, :city, :province, :landline, :date_drivers_licence_expires, :payment_method, :consent_to_credit_check, :net_monthly_household_income, :max_rental_approved, :clean_credit_record)
    end
end