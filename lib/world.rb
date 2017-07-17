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

  def width
    @cells.max_by(&:x).x + 1
  end

  def height
    @cells.max_by(&:y).y + 1
  end
end
