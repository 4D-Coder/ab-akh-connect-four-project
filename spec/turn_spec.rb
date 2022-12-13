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
    it '8. Can check for connect four' do
      not_connect_four = [[:A1, {column: 1, row: 1, checker: nil}],
                          [:B1, {column: 2, row: 1, checker: 'X'}],
                          [:C1, {column: 3, row: 1, checker: 'X'}],
                          [:D1, {column: 4, row: 1, checker: 'X'}]]
      expect(@turn.connect_four?(not_connect_four)).to eq(false)

      not_connect_four = [[:A1, {column: 1, row: 1, checker: nil}],
                          [:B1, {column: 2, row: 1, checker: nil}],
                          [:C1, {column: 3, row: 1, checker: nil}],
                          [:D1, {column: 4, row: 1, checker: nil}]]
      expect(@turn.connect_four?(not_connect_four)).to eq(false)

      connect_four = [[:A1, {column: 1, row: 1, checker: 'X'}],
                      [:B1, {column: 2, row: 1, checker: 'X'}],
                      [:C1, {column: 3, row: 1, checker: 'X'}],
                      [:D1, {column: 4, row: 1, checker: 'X'}]]
      expect(@turn.connect_four?(connect_four)).to eq(true)
    end

    it '9. can check for winner in row' do
      expect(@turn.winner_row?(:A1)).to eq(false)

      @turn.add_checker(:A1)
      @turn.add_checker(:B1)
      @turn.add_checker(:C1)
      @turn.add_checker(:D1)

      expect(@turn.winner_row?(:D1)).to eq(true) #Tests last piece played
      expect(@turn.winner_row?(:F1)).to eq(false) #Test piece outside of win condition's row
    end
  end
end