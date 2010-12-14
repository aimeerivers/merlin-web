class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :adventure, :current_user, :user_signed_in?

  protected

  def sign_in_required
    unless user_signed_in?
      session[:return_to] = request.path
      redirect_to sign_in_path, notice: 'Please sign in first.'
    end
  end

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
