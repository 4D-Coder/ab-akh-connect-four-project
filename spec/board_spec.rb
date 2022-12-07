require './lib/board'

describe 'Board' do

  context 'Iteration 1' do
    before(:each) do
      @board = Board.new
    end

    it '1. exists' do
      expect(@board).to be_a(Board)
    end

    it '2. has readable attributes' do
      expect(@board.layout).to be_a(Hash)
    end
  end
end