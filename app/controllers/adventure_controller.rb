class AdventureController < ApplicationController

  def play
    session[:adventure] ||= Adventure.new
  end

  def new
    session[:adventure] = Adventure.new
    redirect_to adventure_path
  end

  def move
    unless adventure.move(params[:direction])
      flash[:error] = "You cannot go that way."
    end
    redirect_to adventure_path
  end

end
