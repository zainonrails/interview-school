class ApplicationController < ActionController::Base

  def current_user
    @current_user ||= Student.first
  end
end
