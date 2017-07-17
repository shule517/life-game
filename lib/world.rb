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

  def to_s
    (0..height).flat_map { |y|
      (0..width).flat_map { |x|
        at(x, y).to_s
      }.join
    }.join("\n")
  end

  def neighbours(x, y)
    ([-1, 0, 1].product([-1, 0, 1]) - [[0, 0]]).map { |x_offset, y_offset|
      at(x + x_offset, y + y_offset)
    }.compact
  end

  def neighbours_alive_count(x, y)
    neighbours(x, y).select(&:alive?).size
  end

  def next
    @cells.map { |cell|
      [cell, neighbours_alive_count(cell.x, cell.y)]
    }.each do |cell, neighbours_alive_count|
      cell.next(neighbours_alive_count)
    end
  end
end
