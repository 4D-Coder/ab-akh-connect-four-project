require './lib/turn'
require './lib/board'

describe 'Turn' do
  context 'Iteration2' do
    before(:each) do
      @turn = Turn.new 
      @board = Board.new
    end 

    it '1. Can create an instance' do
      expect(@turn).to be_a(Turn)
    end

    it '2. can instantiate a board with a readable attibute' do
      expect(@board).to be_a(Board)
      #Should we create a player and add as argument to initialize a Turn?
    end

    xit '3. can check if board is full' do
      expect(@turn.board_full?).to eq(false)
    
      @board.layout.each do |cell|
        cell[1][:checker] = "X"
      end
      expect(@turn.board_full?).to eq(true)          
    end

    xit '4. can get random column' do
      # Check that random column returns anything from A-G
      columns = ["A", "B", "C", "D", "E", "F", "G"]
      expect(columns).to include(@turn.random_column)

      # Fill all columns expect for "A" with "X" checkers
      @board.layout.each do |cell|
        cell[1][:checker] = "X" if cell[1][:column] != "A"
      end

      # Check that random column returns A when all other columns full
      expect(turn.random_column).to eq("A")
    end
  end
end