class ItemsController < ApplicationController

  def take
    unless adventure.take_item(params[:item])
      flash[:error] = "It's not here."
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
