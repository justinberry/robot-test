require 'facing'
require 'table'

class ControlPanel
  def initialize(robot)
    @robot = robot
    @facings = [Facing::NORTH, Facing::EAST, Facing::SOUTH, Facing::WEST]
    @current_facing = 0
  end

  def place(x, y, facing)
    return if x < 0 || y < 0
    return if x >= Table::MAX_WIDTH || y >= Table::MAX_HEIGHT

    @robot.x = x
    @robot.y = y
    @robot.facing = facing
    @current_facing = @facings.index(facing)
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
    place(@robot.x, @robot.y + 1, @robot.facing) if @robot.facing == Facing::NORTH
    place(@robot.x, @robot.y - 1, @robot.facing) if @robot.facing == Facing::SOUTH
    place(@robot.x + 1, @robot.y, @robot.facing) if @robot.facing == Facing::EAST
    place(@robot.x - 1, @robot.y, @robot.facing) if @robot.facing == Facing::WEST
  end

  def report
    puts "#{@robot.x},#{@robot.y},#{@robot.facing}"
  end

  private

  def current_facing
    @facings[@current_facing % @facings.size] 
  end
end
