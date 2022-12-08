require './lib/turn'


describe 'Turn' do
  context 'Iteration1' do
    before(:each) do
      @turn = Turn.new
    end

    it '1. Can create an instance' do
      expect(@turn).to be_a(Turn)
    end
  end
end