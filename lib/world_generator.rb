class WorldGenerator
  def generate(map_text)
    World.new.tap do |world|
      map_text.each_line.map(&:chomp).each_with_index do |line, y|
        line.chars.each_with_index do |char, x|
          cell = Cell.new(x, y, char == '■')
          world.add_cell(cell)
        end
      end
    end
  end
end
