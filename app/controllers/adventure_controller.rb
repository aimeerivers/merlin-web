class AdventureController < ApplicationController

  def play
    @adventure = Adventure.new
  end

end
