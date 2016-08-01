class LineTypesController < ApplicationController
  before_action :set_line_type, only: [:show, :edit, :update, :destroy]

  def index
    @line_types = LineType.all
  end

  def new
    @line_type = LineType.new
  end

  def edit
  end

  def create
    @line_type = LineType.new(line_type_params)

    respond_to do |format|
      if @line_type.save
        format.html { redirect_to line_types_path, notice: 'Line Type was successfully created.' }
        format.json { render :index, status: :created, location: @line_type }
      else
        format.html { render :new }
        format.json { render json: @line_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @line_type.update(line_type_params)
        format.html { redirect_to line_types_path, notice: 'Line Type was successfully updated.' }
        format.json { render :index, status: :ok, location: @line_type }
      else
        format.html { render :edit }
        format.json { render json: @line_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @line_type.destroy
    respond_to do |format|
      format.html { redirect_to line_types_url, notice: 'Line Type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_line_type
      @line_type = LineType.find(params[:id])
    end

    def line_type_params
      params.require(:line_type).permit(:user_id, :line_type, :description)
    end
end