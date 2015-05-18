require 'facing'
require 'table'

class ControlPanel
  def initialize(robot)
    @robot = robot  
  end

  def place(x, y, direction)
    return if x < 0 || y < 0
    return if x >= Table::MAX_WIDTH || y >= Table::MAX_HEIGHT

    @robot.x = x
    @robot.y = y
    @robot.facing.update(direction)
  end

  def left
    @robot.facing.turn_left()
  end

  def right
    @robot.facing.turn_right()
  end

  def move
    place(@robot.x, @robot.y + 1, @robot.facing.current_direction) if @robot.facing.current_direction == Facing::NORTH
    place(@robot.x, @robot.y - 1, @robot.facing.current_direction) if @robot.facing.current_direction == Facing::SOUTH
    place(@robot.x + 1, @robot.y, @robot.facing.current_direction) if @robot.facing.current_direction == Facing::EAST
    place(@robot.x - 1, @robot.y, @robot.facing.current_direction) if @robot.facing.current_direction == Facing::WEST
  end

  def report
    puts "#{@robot.x},#{@robot.y},#{@robot.facing.current_direction}"
  end
end
