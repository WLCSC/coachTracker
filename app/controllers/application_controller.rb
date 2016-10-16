class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def pseudoyear?
    session[:pseudoyear]
  end

  def current_year
    begin
      @current_year ||= Year.find(session[:pseudoyear] || File.read('current_year'))
    rescue
      cy = Date.today.year
      cy -= 1 if Date.today.month < 6
      File.open('current_year' ,'w') do |f|
        f << cy
      end
      @current_year ||= Year.find(session[:pseudoyear] || File.read('current_year'))
    end
  end

  helper_method :current_year, 'pseudoyear?'
end
