class ReportsController < ApplicationController
  def index
  end

  def sports
    @sports = Sport.where(:certified => true)
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
