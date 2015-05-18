class Facing
  NORTH = "NORTH"
  EAST = "EAST"
  SOUTH = "SOUTH"
  WEST = "WEST"

  def initialize
    @current_direction = 0
    @directions = [NORTH, EAST, SOUTH, WEST]
  end
  
  def update(facing)
    @current_direction = @directions.index(facing)
  end 

  def current_direction
    @directions[@current_direction % @directions.size] 
  end 

  def turn_left
    @current_direction = (@current_direction - 1) % @directions.size
  end

  def turn_right
    @current_direction = (@current_direction + 1) % @directions.size
  end

end
