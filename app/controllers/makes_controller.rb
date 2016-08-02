class MakesController < ApplicationController
  before_action :set_make, only: [:show, :edit, :update, :destroy]

  def index
    @makes = Make.all
    @make = Make.new
  end

  def new
    @make = Make.new
  end

  def edit
  end

  def create
    @make = Make.new(make_params)

    respond_to do |format|
      if @make.save
        format.html { redirect_to makes_path, notice: 'Make was successfully created.' }
        format.json { render :index, status: :created, location: @make }
      else
        format.html { render :new }
        format.json { render json: @make.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @make.update(make_params)
        format.html { redirect_to makes_path, notice: 'Make was successfully updated.' }
        format.json { render :index, status: :ok, location: @make }
      else
        format.html { render :edit }
        format.json { render json: @make.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @make.destroy
    respond_to do |format|
      format.html { redirect_to makes_url, notice: 'Make was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_make
      @make = Make.find(params[:id])
    end

    def make_params
      params.require(:make).permit(:name)
    end
end