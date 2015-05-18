class Robot
  attr_accessor :x, :y, :facing

  def initialize
    @x = 0
    @y = 0
    @facing = Facing.new
  end
end
