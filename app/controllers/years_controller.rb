class YearsController < ApplicationController
  before_action :set_year, only: [:show, :edit, :update, :destroy]

  # GET /years
  # GET /years.json
  def index
    @years = Year.order(:id)
  end

  # GET /years/1
  # GET /years/1.json
  def show
  end

  # GET /years/new
  def new
    @year = Year.new
  end

  # GET /years/1/edit
  def edit
  end

  # POST /years
  # POST /years.json
  def create
    @year = Year.new(year_params)

    respond_to do |format|
      if @year.save
        format.html { redirect_to @year, notice: 'Year was successfully created.' }
        format.json { render :show, status: :created, location: @year }
      else
        format.html { render :new }
        format.json { render json: @year.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /years/1
  # PATCH/PUT /years/1.json
  def update
    respond_to do |format|
      if @year.update(year_params)
        format.html { redirect_to @year, notice: 'Year was successfully updated.' }
        format.json { render :show, status: :ok, location: @year }
      else
        format.html { render :edit }
        format.json { render json: @year.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /years/1
  # DELETE /years/1.json
  def destroy
    @year.destroy
    respond_to do |format|
      format.html { redirect_to years_url, notice: 'Year was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def rollover
    @next_year = Year.find_or_create_by(id: params[:newyear])    
    f = File.open("rollover-log-#{@next_year.id}.txt", 'w')
    Sport.all.each do |s|
      s.start_date = Date.strptime(params['start-' + s.id.to_s], '%Y-%m-%d')
      s.end_date = Date.strptime(params['end-' + s.id.to_s], '%Y-%m-%d')
      if s.save
        f << "#{s.name} \t\t #{s.start_date} \t\t #{s.end_date}\n"
      else
	f << '*' * 40 + "\n"
	f << "#{s.name}"
	f << s.errors.full_messages.join("\n")
	f << '*' * 40 + "\n"
      end
    end
    f << "\n"

    Position.where(year: current_year).each do |p|
      if params["rollover-#{p.id}"]
        f << "Roll Over position ##{p.id}..."
        n = p.dup
        n.id = nil
        n.year = @next_year
        n.hire = Date.today
	n.reported = false
	n.experience += 1 if n.experience < 10 && n.experience >= 0 && n.role.category.pay > 0
        if n.save
	  f << "OK\n"
        else
	  f << "Error!\n"
	  f << '*' * 40 + "\n"
	  f << n.errors.full_messages.join("\n")
	  f << '*' * 40 + "\n"
        end
      end
    end
    f.close
    File.open('current_year', 'w') do |f|
      f << @next_year.id
    end

    redirect_to years_path, notice: 'Successfully rolled over to ' + current_year.name
  end

  def pseudo
    if params[:year] && Year.find(params[:year])
      session[:pseudoyear] = params[:year]
    else
      session.delete :pseudoyear
    end
    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_year
      @year = Year.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def year_params
      params.require(:year).permit(:id)
    end
end
