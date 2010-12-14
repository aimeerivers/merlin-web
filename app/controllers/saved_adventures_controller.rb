class SavedAdventuresController < ApplicationController
  before_filter :sign_in_required

  def index
    @saved_adventures = current_user.saved_adventures.newest_first
  end

  def new
    @saved_adventure = SavedAdventure.new
  end

  def create
    saved_adventure_params = params[:saved_adventure]
    saved_adventure_params.merge!({user_id: current_user.id, adventure: ActiveSupport::JSON.encode(adventure)})
    @saved_adventure = SavedAdventure.new(saved_adventure_params)
    if @saved_adventure.save
      redirect_to(adventure_path, :notice => 'Your adventure has been saved. Carry on!')
    else
      render :action => "new"
    end
  end

  def restore
    saved_adventure = SavedAdventure.find(params[:id])
    session[:adventure] = Adventure.new.restore(ActiveSupport::JSON.decode(saved_adventure.adventure))
    redirect_to adventure_path
  end

end
