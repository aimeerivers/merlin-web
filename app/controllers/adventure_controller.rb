class AdventureController < ApplicationController

  def play
    render(:adventure_over) if adventure.over?
  end

  def new
    session[:adventure] = Adventure.new
    redirect_to adventure_path
  end

  def move
    begin
      flash[:success] = adventure.move(params[:direction])
    rescue AdventureErrors::CannotGoThatWayError
      flash[:error] = "You can't go that way."
    rescue AdventureErrors::CannotPassError => e
      flash[:notice] = e.message
    end
    adventure_response
  end

  def quit; end

  def really_quit
    adventure.quit!
    redirect_to adventure_path
  end

end
