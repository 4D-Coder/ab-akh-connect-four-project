require './lib/board'

describe 'Board' do

  context 'Iteration 1' do
    before(:each) do
      @board = Board.new
    end

    it '1. Exists' do
      expect(@board).to be_a(Board)
    end

    it '2. Has readable attributes' do
      expect(@board.layout).to be_a(Hash)
    end

    it '3. Can build board' do
      expect(@board.layout.length).to eq(42)

      num_columns = @board.layout.select do |key, value|
        value[:row] == 6
      end

      expect(num_columns.length).to be(7)

      num_rows = @board.layout.select do |key, value|
        value[:column] == 3
      end

      expect(num_rows.length).to be(6)
    end
  end
end