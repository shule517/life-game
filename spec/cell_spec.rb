describe Cell do
  describe '#alive?' do
    context '生きている場合' do
      let(:alive_cell) { Cell.new(true) }
      it '生きてること' do
        expect(alive_cell.alive?).to eq true
      end
    end

    context '死んでいる場合' do
      let(:dead_cell) { Cell.new(false) }
      it '死んでいること' do
        expect(dead_cell.alive?).to eq false
      end
    end
  end

  describe '#die' do
    let(:alive_cell) { Cell.new(true) }
    it '死ぬこと' do
      alive_cell.die
      expect(alive_cell.alive?).to eq false
    end
  end

  describe '#born' do
    let(:dead_cell) { Cell.new(false) }
    it '死んでいること' do
      dead_cell.born
      expect(dead_cell.alive?).to eq true
    end
  end
end
