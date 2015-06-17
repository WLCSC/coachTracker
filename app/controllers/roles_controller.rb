class RolesController < ApplicationController
  before_action :set_role, only: [:show, :edit, :update, :destroy]
  before_action :set_sport

  # GET /roles/new
  def new
    @role = Role.new
  end

  # GET /roles/1/edit
  def edit
  end

  # POST /roles
  # POST /roles.json
  def create
    @role = @sport.roles.build(role_params)
    if @role.save
      redirect_to @sport, notice: 'Role was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /roles/1
  # PATCH/PUT /roles/1.json
  def update
    if @role.update(role_params)
        redirect_to @sport, notice: 'Role was successfully updated.'
      else
        render :edit
    end
  end

  # DELETE /roles/1
  # DELETE /roles/1.json
  def destroy
    @role.destroy
    respond_to do |format|
      format.html { redirect_to @sport, notice: 'Role was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_role
      @role = Role.find(params[:id])
    end

    def set_sport
      @sport = Sport.find(params[:sport_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def role_params
      params.require(:role).permit(:name, :category_id, :fte)
    end
end
