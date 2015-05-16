require 'facing'

class ControlPanel
  def initialize(robot)
    @robot = robot
    @facings = [Facing::NORTH, Facing::EAST, Facing::SOUTH, Facing::WEST]
    @current_facing = 0
  end

  def place(x, y, facing)
    return if x >= Table::MAX_WIDTH || y >= Table::MAX_HEIGHT

    @robot.x = x
    @robot.y = y
    @robot.facing = facing
  end

  def left
   @current_facing = (@current_facing - 1) % @facings.size
   @robot.facing = current_facing()
  end

  def right
   @current_facing = (@current_facing + 1) % @facings.size
   @robot.facing = current_facing()
  end

  def move

  end

  private
  def current_facing
    @facings[@current_facing % @facings.size] 
  end
  
end
