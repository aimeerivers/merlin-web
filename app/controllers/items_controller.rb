class ItemsController < ApplicationController

  def take
    begin
      adventure.take_item(params[:item])
    rescue AdventureErrors::ItemNotHereError
      flash[:error] = "It's not here."
    rescue AdventureErrors::CarryingTooMuchError
      flash[:error] = "You're carrying too much."
    end
    redirect_to adventure_path
  end

  def drop
    unless adventure.drop_item(params[:item])
      flash[:error] = "You haven't taken that."
    end
    redirect_to adventure_path
  end

  def use
    message = adventure.use_item(params[:item])
    flash[:notice] = message if message
    flash[:error] = "You haven't got that." unless message
    redirect_to adventure_path
  end

end
