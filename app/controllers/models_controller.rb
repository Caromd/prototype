class ModelsController < ApplicationController
  before_action :set_model, only: [:show, :edit, :update, :destroy]
  before_action :get_dropdowns, only: [:index, :edit]

  def index
    @models = Model.all
    @model = Model.new
  end

  def new
    @model = Model.new
  end

  def edit
  end

  def create
    @model = Model.new(model_params)

    respond_to do |format|
      if @model.save
        format.html { redirect_to models_path, notice: 'Model was successfully created.' }
        format.json { render :index, status: :created, location: @model }
      else
        format.html { render :new }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @model.update(model_params)
        format.html { redirect_to models_path, notice: 'Model was successfully updated.' }
        format.json { render :index, status: :ok, location: @model }
      else
        format.html { render :edit }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @model.destroy
    respond_to do |format|
      format.html { redirect_to models_url, notice: 'Model was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_model
      @model = Model.find(params[:id])
    end
    
    def get_dropdowns
      @makes = Make.all
    end

    def model_params
      params.require(:model).permit(:name, :make_id)
    end
end
