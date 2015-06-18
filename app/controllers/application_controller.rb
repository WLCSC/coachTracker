class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_year
    cy = Date.today.year
		cy -= 1 if Date.today.month < 6
    cy
  end

  helper_method :current_year
end
