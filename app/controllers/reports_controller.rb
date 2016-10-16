class ReportsController < ApplicationController
  def index
  end

  def sports
    if params[:sport_id]
      @sports = Sport.where(id: params[:sport_id])
    else
      @sports = Sport.where(:certified => true)
    end
  end

  def hire
    @sports = Sport.all
  end

  def report
    Position.where(reported: false).each do |p|
      p.reported = true
      p.save
    end
    redirect_to root_path
  end
end
