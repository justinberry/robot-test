require 'facing'

class Mover

  VECTORS = { Facing::NORTH => { x: 0, y: 1 },
              Facing::SOUTH => { x: 0, y: -1 },
              Facing::EAST => { x: 1, y: 0 },
              Facing::WEST => { x: -1, y: 0 } }

  def initialize(robot)
    @robot = robot
  end

  def go
    update_x(@robot.x + VECTORS[@robot.facing.current_direction][:x])
    update_y(@robot.y + VECTORS[@robot.facing.current_direction][:y])
  end

  def teleport(x, y)
    update_x(x)
    update_y(y)
  end

  private

  def update_x(x)
    @robot.x = x if x >= 0 && x < Table::MAX_WIDTH
  end

  def update_y(y)
    @robot.y = y if y >= 0 && y < Table::MAX_HEIGHT
  end
end
