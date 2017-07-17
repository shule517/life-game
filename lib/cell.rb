class Cell
  def initialize(alive)
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
end
