class OwnersController < ApplicationController
  before_action :set_owner, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @owners = Owner.all
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

    def owner_params
      params.require(:owner).permit(:user_id, :name, :mobile, :email)
    end
end
