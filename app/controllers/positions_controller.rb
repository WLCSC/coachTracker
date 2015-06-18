class PositionsController < ApplicationController
  before_action :set_position, only: [:show, :edit, :update, :destroy]

  # GET /positions
  # GET /positions.json
  def index
    @sports = Sport.order(:short)
  end

  # GET /positions/1
  # GET /positions/1.json
  def show
    redirect_to positions_path
  end

  # GET /positions/new
  def new
    @position = Position.new
    @position.person_id = params[:person_id]
    @position.role_id = params[:role_id]
    if params[:fte]
      @position.fte = case params[:fte]
      when '100'
        1.0
      when '75'
        0.75
      when '66'
        0.666
      when '50'
        0.5
      when '33'
        0.333
      when '25'
        0.25
      end
    end
  end

  # GET /positions/1/edit
  def edit
  end

  # POST /positions
  # POST /positions.json
  def create
    @position = Position.new(position_params)

    respond_to do |format|
      if @position.save
        format.html { redirect_to positions_path, notice: 'Position was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /positions/1
  # PATCH/PUT /positions/1.json
  def update
    respond_to do |format|
      if @position.update(position_params)
        format.html { redirect_to positions_path, notice: 'Position was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /positions/1
  # DELETE /positions/1.json
  def destroy
    @position.destroy
    respond_to do |format|
      format.html { redirect_to positions_url, notice: 'Position was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_position
      @position = Position.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def position_params
      params.require(:position).permit(:hire, :experience, :fte, :year_id, :role_id, :person_id, :sport_id, :reported)
    end
end
