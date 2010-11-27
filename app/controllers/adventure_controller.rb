class AdventureController < ApplicationController

  def play
    session[:adventure] ||= Adventure.new
  end

  def move
    adventure.move(params[:direction])
    redirect_to adventure_path
  end

end
