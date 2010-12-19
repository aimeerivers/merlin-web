class ScoresController < ApplicationController

  def index
    @scores = Score.top
  end

  def new
    @score = Score.new
  end

  def create
    @score = Score.new(params[:score].merge({score: adventure.score}))
    if @score.save
      session[:name] = @score.name
      redirect_to scores_path
    else
      render :new
    end
  end

end
