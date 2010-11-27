class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :adventure

  protected

  def adventure
    session[:adventure]
  end

end
