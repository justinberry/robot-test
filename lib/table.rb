class Table
  attr_reader :max_width, :max_height

  def initialize(max_width, max_height)
    
    if max_width < 0 || max_height < 0
      throw "invalid table size (#{max_width},#{max_height})"
    end
  
    @max_width = max_width
    @max_height = max_height
  end
end
