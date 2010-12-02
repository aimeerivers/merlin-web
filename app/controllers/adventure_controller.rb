class AdventureController < ApplicationController

  def play
    session[:adventure] ||= Adventure.new
  end

  def new
    session[:adventure] = Adventure.new
    redirect_to adventure_path
  end

  def move
    begin
      unless adventure.move(params[:direction])
        flash[:error] = "You can't go that way."
      end
    rescue AdventureErrors::CannotPassError => e
      flash[:notice] = e.message
    end
    redirect_to adventure_path
  end

end
