require 'facing'
require 'table'

class ControlPanel
  def initialize(robot)
    @robot = robot  
  end

  def place(x, y, direction)
    @robot.mover.teleport(x, y)
    @robot.facing.update(direction)
  end

  def left
    @robot.facing.turn_left()
  end

  def right
    @robot.facing.turn_right()
  end

  def move
    @robot.mover.go()
  end

  def report
    puts "#{@robot.x},#{@robot.y},#{@robot.facing.current_direction}"
  end
end
