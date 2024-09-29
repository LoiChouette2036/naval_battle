class Game < ApplicationRecord
  belongs_to :creator, class_name: "User"
  belongs_to :opponent, class_name: "User", optional: true

  # Add ship lists for both players
  attr_accessor :creator_ships, :opponent_ships

  after_initialize :initialize_ships

  # Initialize the ships for each player
  def initialize_ships
    self.creator_ships = [
      Ship.new("Aircraft Carrier", 5),
      Ship.new("Battleship", 4),
      Ship.new("Submarine", 3),
      Ship.new("Destroyer", 3),
      Ship.new("Patrol Boat", 2)
    ]

    self.opponent_ships = [
      Ship.new("Aircraft Carrier", 5),
      Ship.new("Battleship", 4),
      Ship.new("Submarine", 3),
      Ship.new("Destroyer", 3),
      Ship.new("Patrol Boat", 2)
    ]
  end

  # Method to place a ship on a player's grid
  def place_ship_on_grid(grid, ship, start_position, direction)
    x, y = start_position

    # Validate ship placement: check if the ship fits in the grid
    if direction == "horizontal"
      return false if y + ship.size > 10 # Grid size is 10*10
    elsif direction == "vertical"
      return false if x + ship.size > 10
    end

    # Check for overlapping ships
    ship.size.times do |i|
      if direction == "horizontal"
        return false if grid[x][y+i] != 0 # Cell already occupied
      elsif direction == "vertical"
        return false if grid[x+i][y] != 0 # Cell already occupied
      end
    end

    # Place the ship on the grid
    ship.size.times do |i|
      if direction == "horizontal"
        grid[x][y+i] = 1 # Mark grid cells with 1 for the ship
        ship.positions << [ x, y+i ] # Store the ship's position in its coordinates
      elsif direction == "vertical"
        grid[x +i][y] = 1
        ship.positions << [ x+i, y ] # Store the ship's position in its coordinates
      end
    end

    true # Indicates the ship was placed successfully
  end
end
