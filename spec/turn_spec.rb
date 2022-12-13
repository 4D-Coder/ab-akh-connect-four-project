require './lib/turn'
require './lib/board'
require './lib/player'


describe 'Turn' do
  before(:each) do
    @board = Board.new
    @player = Player.new('Player', 'X')
    @turn = Turn.new(@board, @player) 
  end 

  context 'Iteration2' do
    it '1. Can create an instance' do
      expect(@turn).to be_a(Turn)
    end

    it '2. can instantiate a board with a readable attibute' do
      expect(@board).to be_a(Board)
      #Should we create a player and add it as an argument to initialize a Turn?
    end

    it '3. can check if board is full' do
      # Check that the board full method returns false when board is empty
      expect(@turn.board_full?).to eq(false)
      
      # Fill entire board with 'X' checkers
      @turn.board.layout.each do |cell|
        cell[1][:checker] = 'X'
      end
     
      # Check that the board full method returns true when board is true
      expect(@turn.board_full?).to eq(true)          
    end

    it '4. can get random column' do
      # Check that random column returns anything from A-G
      columns = ['A', 'B', 'C', 'D', 'E', 'F', 'G']
      expect(columns).to include(@turn.random_column)

      # Fill all columns expect for 'A' with 'X' checkers
      @turn.board.layout.each do |cell|
        cell[1][:checker] = 'X' if cell[1][:column] != 1
      end

      # Check that random column returns A when all other columns full
      expect(@turn.random_column).to eq('A')
    end

    it '5. can check if column is full' do
      # Fill all columns expect for 'A' with 'X' checkers
      @turn.board.layout.each do |cell|
        cell[1][:checker] = 'X' if cell[1][:column] != 1
      end
      
      expect(@turn.column_full?('A')).to eq(false)
      expect(@turn.column_full?('B')).to eq(true)
    end

    it '6. can find the lowest position' do
      #Analyzes the lowest placement in any given column
      expect(@turn.lowest_position('G')).to eq(:G1)
      
      @turn.board.layout[:E1][:checker] = 'X'

      expect(@turn.lowest_position('E')).to eq(:E2)
      
    end

    it '7. can add checker' do
      expect(@turn.board.layout[:A1][:checker]).to eq(nil)

      @turn.add_checker(:A1)

      expect(@turn.board.layout[:A1][:checker]).to eq('X')

    end
  end

  context 'Iteration 3' do
  
  end
end