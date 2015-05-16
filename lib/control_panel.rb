class ControlPanel
  def initialize(robot, table)
    @robot = robot
    @table = table
  end

  def place(x, y, facing)
    return if x >= @table.max_width || y >= @table.max_height

    @robot.x = x
    @robot.y = y
    @robot.facing = facing
  end
end
