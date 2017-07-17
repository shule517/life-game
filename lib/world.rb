class World
  def initialize
    @cells = []
  end

  def add_cell(cell)
    @cells << cell
  end

  def at(x, y)
    @cells.find { |cell| cell.x == x && cell.y == y }
  end
end
