class GamesController < ApplicationController
  before_action :authenticate_user!

  def new
    @game= Game.new
  end

  def create
    @game = Game.new(creator: current_user)
    if @game.save
      redirect_to @game, notice: "Game created successfully"
    else
      render :new
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  def join
    @game = Game.find(params[:id])
    if @game.opponent.nil?
      @game.update(opponent: current_user)
      redirect_to @game, notice: "You have successfully joined the game"
    else
      redirect_to root_path, alert: "This game already has an opponent."
    end
  end
end
