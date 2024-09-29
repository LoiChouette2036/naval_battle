class AddGridsToGames < ActiveRecord::Migration[7.2]
  def change
    add_column :games, :creator_own_grid, :json, default: []
    add_column :games, :creator_guess_grid, :json, default: []
    add_column :games, :opponent_own_grid, :json, default: []
    add_column :games, :opponent_guess_grid, :json, default: []
  end
end
