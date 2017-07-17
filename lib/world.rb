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
    [-1, 0, 1].flat_map { |y_offset|
      [-1, 0, 1].flat_map do |x_offset|
        at(x + x_offset, y + y_offset) unless x_offset == 0 && y_offset == 0
      end
    }.compact
  end

  def neighbours_alive_count(x, y)
    neighbours(x, y).select(&:alive?).size
  end

  def next
  end
end
