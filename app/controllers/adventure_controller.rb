class AdventureController < ApplicationController

  def play
    session[:adventure] ||= Adventure.new
  end

  def new
    session[:adventure] = Adventure.new
    redirect_to adventure_path
  end

  def move
    adventure.move(params[:direction])
    redirect_to adventure_path
  end

end
