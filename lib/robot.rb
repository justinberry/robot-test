require 'mover'

class Robot
  attr_accessor :x, :y, :facing, :mover

  def initialize
    @x = 0
    @y = 0
    @facing = Facing.new
    @mover = Mover.new(self)
  end
end
