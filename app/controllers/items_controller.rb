class ItemsController < ApplicationController

  def take
    unless adventure.take_item(params[:item])
      flash[:error] = "You cannot take that item."
    end
    redirect_to adventure_path
  end

  def drop
    unless adventure.drop_item(params[:item])
      flash[:error] = "You cannot drop an item you do not have."
    end
    redirect_to adventure_path
  end

end
