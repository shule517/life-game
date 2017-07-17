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

  describe '#width #height' do
    let (:world) { World.new }
    it 'セルが生成されること' do
      world.add_cell(Cell.new(1, 2, true))
      world.add_cell(Cell.new(3, 1, true))
      expect(world.width).to eq 4
      expect(world.height).to eq 3
    end
  end

  # describe '#to_s' do
  #   let (:world) { World.new }
  #   context 'セルがない場合' do
  #     it 'nilを返すこと' do
  #       expect(world.at(0, 0)).to eq nil
  #     end
  #   end
  # end
end
