require './lib/board'

describe 'Board' do

  context 'Iteration 1' do
    before(:each) do
      @board = Board.new
    end

    it 'exists' do
      expect(@board).to be_a(Board)
    end
  end
end