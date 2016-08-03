class OwnersController < ApplicationController
  before_action :set_owner, only: [:show, :edit, :update, :destroy]
  before_action :get_dropdowns, only: [:new, :edit]
  before_action :authenticate_user!

  def index
    @q = Owner.ransack(params[:q])
    @owners = @q.result.order(id: 'desc')
  end

  def new
    @owner = Owner.new
  end

  def edit
  end

  def create
    @owner = Owner.new(owner_params)

    respond_to do |format|
      if @owner.save
        format.html { redirect_to owners_path, notice: 'Owner was successfully created.' }
        format.json { render :index, status: :created, location: @owner }
      else
        format.html { render :new }
        format.json { render json: @owner.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @owner.update(owner_params)
        format.html { redirect_to owners_path, notice: 'Owner was successfully updated.' }
        format.json { render :index, status: :ok, location: @owner }
      else
        format.html { render :edit }
        format.json { render json: @owner.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @owner.destroy
    respond_to do |format|
      format.html { redirect_to owners_url, notice: 'Owner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_owner
      @owner = Owner.find(params[:id])
    end

    def get_dropdowns
      @legal_entities = ["Individual","Partnership","CC","Company/Trust"]
      @services_required = ["Fully Managed", "Rental Collection Only"]
      @provinces = ["Western Cape","Other"]
    end

    def owner_params
      params.require(:owner).permit(:user_id, :name, :mobile, :email, :legal_entity, :id_number, :registered_name, :trading_name, :registration_number, :residential_address1, :residential_address2, :suburb, :city, :province, :landline,:service_required, :agent, :rebate_rate, :vat_number,:bank, :type_of_account, :branch_code, :account_number, :contact_name, :contact_surname, :contact_telephone_number, :contact_email_address)
    end
end
