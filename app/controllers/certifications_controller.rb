class CertificationsController < ApplicationController
  before_action :set_certification, only: [:show, :edit, :update, :destroy]
  before_action :set_person

  # GET /certifications/new
  def new
    @certification = @person.certifications.build
  end

  # GET /certifications/1/edit
  def edit
  end

  # POST /certifications
  # POST /certifications.json
  def create
    @certification = @person.certifications.build(certification_params)

    respond_to do |format|
      if @certification.save
        format.html { redirect_to @person, notice: 'Certification was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /certifications/1
  # PATCH/PUT /certifications/1.json
  def update
    respond_to do |format|
      if @certification.update(certification_params)
        format.html { redirect_to @person, notice: 'Certification was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /certifications/1
  # DELETE /certifications/1.json
  def destroy
    @certification.destroy
    respond_to do |format|
      format.html { redirect_to @person, notice: 'Certification was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_certification
      @certification = Certification.find(params[:id])
    end

    def set_person
      @person = Person.find(params[:person_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def certification_params
      params.require(:certification).permit(:course_id, :year_id, :person_id)
    end
end
