class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :adventure, :current_user, :user_signed_in?

  protected

  def adventure
    session[:adventure]
  end

  def current_user
    return nil unless user_signed_in?
    User.find_by_identifier(session[:current_user_identifier])
  end

  def user_signed_in?
    !session[:current_user_identifier].nil?
  end

end
