describe WorldGenerator do
  describe '#generate' do
    let (:world) { WorldGenerator.new.generate(map_text) }
    let (:map_text) {
      <<~MAP
        □■□□
        □□□■
        ■□□■
      MAP
    }
    it 'マップが生成されること' do
      expect(world.to_s).to eq map_text
    end
  end
end
