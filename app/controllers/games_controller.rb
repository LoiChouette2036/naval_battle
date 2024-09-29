class GamesController < ApplicationController
  before_action :authenticate_user!

  def new
    @game= Game.new
  end

  def create
    @game = Game.new(creator: current_user)
    initialize_grids(@game) # Initializes grids here
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

  private

  # initialize both players' grids with 10*10 empty arrays (represented by 0s)
  def initialize_grids(game)
    empty_grid = Array.new(10) { Array.new(10, 0) } # Creates a 10*10 grid with all values set to 0
    game.creator_own_grid = empty_grid
    game.creator_guess_grid = empty_grid
    game.opponent_own_grid = empty_grid
    game.opponent_guess_grid = empty_grid
  end
end
