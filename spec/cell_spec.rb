describe Cell do
  describe '#x #y' do
    let(:cell) { Cell.new(12, 23, true) }
    it '位置が取得できること' do
      expect(cell.x).to eq 12
      expect(cell.y).to eq 23
    end
  end

  describe '#alive?' do
    context '生きている場合' do
      let(:alive_cell) { Cell.new(1, 2, true) }
      it '生きてること' do
        expect(alive_cell.alive?).to eq true
      end
    end

    context '死んでいる場合' do
      let(:dead_cell) { Cell.new(1, 2, false) }
      it '死んでいること' do
        expect(dead_cell.alive?).to eq false
      end
    end
  end

  describe '#die' do
    let(:alive_cell) { Cell.new(1, 2, true) }
    it '死ぬこと' do
      alive_cell.die
      expect(alive_cell.alive?).to eq false
    end
  end

  describe '#born' do
    let(:dead_cell) { Cell.new(1, 2, false) }
    it '死んでいること' do
      dead_cell.born
      expect(dead_cell.alive?).to eq true
    end
  end

  describe '#next' do
    context '生きている場合' do
      let(:alive_cell) { Cell.new(1, 2, true) }
      [
        [0, false], # 過疎
        [1, false], # 過疎
        [2, true],
        [3, true],
        [4, false], # 過密
        [5, false], # 過密
        [6, false], # 過密
        [7, false], # 過密
        [8, false], # 過密
      ].each do |arround_alive_count, alive|
        context "周りに生きているセルが#{arround_alive_count}個いる場合" do
          it "#{alive ? '生きていること' : '死んでいること'}" do
            alive_cell.next(arround_alive_count)
            expect(alive_cell.alive?).to eq alive
          end
        end
      end
    end

    context '死んでいる場合' do
      let(:dead_cell) { Cell.new(1, 2, false) }
      [
        [0, false],
        [1, false],
        [2, false],
        [3, true], # 生き返る
        [4, false],
        [5, false],
        [6, false],
        [7, false],
        [8, false],
      ].each do |arround_alive_count, alive|
        context "周りに生きているセルが#{arround_alive_count}個いる場合" do
          it "#{alive ? '生きていること' : '死んでいること'}" do
            dead_cell.next(arround_alive_count)
            expect(dead_cell.alive?).to eq alive
          end
        end
      end
    end
  end
end
