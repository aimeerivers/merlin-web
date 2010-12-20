class ItemsController < ApplicationController

  def take
    begin
      adventure.take_item(params[:item])
    rescue AdventureErrors::ItemNotHereError
      flash[:error] = "It's not here."
    rescue AdventureErrors::CarryingTooMuchError
      flash[:error] = "You're carrying too much."
    end
    adventure_response
  end

  def drop
    unless adventure.drop_item(params[:item])
      flash[:error] = "You haven't taken that."
    end
    if adventure.completed?
      flash[:success] = "You have solved the mystery of Merlin!"
    end
    adventure_response
  end

  def use
    message = adventure.use_item(params[:item])
    flash[:notice] = message if message
    flash[:error] = "You haven't got that." unless message
    adventure_response
  end

end
