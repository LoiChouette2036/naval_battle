class Ship
  attr_accessor :name, :size, :positions, :hits

  def initialize(name, size)
    @name = name
    @size = size
    @positions = [] # Will store the ship's positions on the grid
    @hits = 0 # Tracks how many hits the ship has taken
  end

  # Checks if the ship is sunk (i.e., all positions have been hit)
  def sunk?
    @hits >= @size
  end
end
