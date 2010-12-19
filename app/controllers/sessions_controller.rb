class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def new; end

  def create
    user = User.from_engage_token(params[:token])
    session[:current_user_identifier] = user.identifier
    redirect_to session[:return_to] || choice_path, notice: "Signed in as #{user.name}."
  end

  def destroy
    session[:current_user_identifier] = nil
    session[:return_to] = nil
    redirect_to choice_path, notice: 'Signed out successfully.'
  end

end
