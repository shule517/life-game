class Cell
  attr_reader :x, :y
  def initialize(x, y, alive)
    @x = x
    @y = y
    @alive = alive
  end

  def alive?
    @alive
  end

  def die
    @alive = false
  end

  def born
    @alive = true
  end

  def next(arround_alive_count)
    if alive?
      die if arround_alive_count <= 1 || 4 <= arround_alive_count
    else
      born if arround_alive_count == 3
    end
  end
end
