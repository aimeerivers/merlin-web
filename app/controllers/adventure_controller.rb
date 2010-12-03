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
      adventure.move(params[:direction])
    rescue AdventureErrors::CannotGoThatWayError
      flash[:error] = "You can't go that way."
    rescue AdventureErrors::CannotPassError => e
      flash[:notice] = e.message
    end
    redirect_to adventure_path
  end

end
