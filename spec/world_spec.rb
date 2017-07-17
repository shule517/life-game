describe World do
  describe '#add_cell #at' do
    let (:world) { World.new }
    let (:cell) { Cell.new(1, 2, true) }
    it 'セルが生成されること' do
      world.add_cell(cell)
      expect(world.at(1, 2).alive?).to eq true
    end
  end

  describe '#at' do
    let (:world) { World.new }
    context 'セルがない場合' do
      it 'nilを返すこと' do
        expect(world.at(0, 0)).to eq nil
      end
    end
  end

  describe '#neighbours_alive_count' do
    let (:world) { WorldGenerator.new.generate(map_text) }
    let (:map_text) {
      <<~MAP
        □■□□
        □■□■
        ■□□■
      MAP
    }
    it '次の世代を表示すること' do
      expect(world.neighbours_alive_count(2, 1)).to eq 4
    end
  end

  describe '#width #height' do
    let (:world) { World.new }
    it 'セルが生成されること' do
      world.add_cell(Cell.new(1, 2, true))
      world.add_cell(Cell.new(3, 1, true))
      expect(world.width).to eq 4
      expect(world.height).to eq 3
    end
  end

  describe '#to_s' do
    let (:world) { World.new }
    context 'セルがない場合' do
      it 'nilを返すこと' do
        world.add_cell(Cell.new(0, 0, true))
        world.add_cell(Cell.new(1, 0, false))
        world.add_cell(Cell.new(2, 0, true))
        world.add_cell(Cell.new(0, 1, true))
        world.add_cell(Cell.new(1, 1, false))
        world.add_cell(Cell.new(2, 1, false))
        expect(world.to_s).to eq <<~MAP
          ■□■
          ■□□
        MAP
      end
    end
  end

  # describe '#next' do
  #   let (:world) { WorldGenerator.new.generate(map_text) }
  #   let (:map_text) {
  #     <<~MAP
  #       □■□□
  #       □■□■
  #       ■□□■
  #     MAP
  #   }
  #   it '次の世代を表示すること' do
  #     world.next
  #     expect(world.to_s).to eq <<~MAP
  #       □□■□
  #       ■□■□
  #       □□■□
  #     MAP
  #   end
  # end
end
