require './lib/board'

class Turn 
  attr_reader :board, :player

  def initialize(board, player)
    @board = board
    @player = player
  end

  def board_full?
    full_board = 42
    @board.layout.each do |cell, attr|
      if attr[:checker] != nil
        full_board -= 1
      else
        break
      end
    end  
    
    full_board == 0
  end

  def random_column
    columns = ["A", "B", "C", "D", "E", "F", "G"]
    columns.shuffle!

    while column_full?(columns[0])
      columns.shift
    end
    
    columns[0]
  end

  def column_full?(column)
    columns = ["A", "B", "C", "D", "E", "F", "G"]

    column_cells = @board.layout.select do |cell|
      @board.layout[cell][:column] == (columns.index(column) + 1) && @board.layout[cell][:checker] == nil
    end

    column_cells.empty?
  end

  def lowest_position(column)
    columns = ["A", "B", "C", "D", "E", "F", "G"]

    column_cells = @board.layout.select do |cell|
      @board.layout[cell][:column] == (columns.index(column) + 1) && @board.layout[cell][:checker] == nil
    end

    column_cells.keys[0]
  end

  def get_input
    input = ""
    columns = ["A", "B", "C", "D", "E", "F", "G"]

    until columns.include?(input)
      puts "✧･ﾟ:* #{@player.name}, Select a Column for your '#{@player.checker}' checker! *:･ﾟ✧"
      puts "               A - B - C - D - E - F - G"
      puts
      input = gets.chomp

      if columns.include?(input) && column_full?(input) == true
        puts "That column is FULL!"
        input = ""
      end
    end

    input
  end

  def add_checker(cell)
    @board.layout[cell][:checker] = @player.checker
    cell
  end

  def play_turn
    if @player.name == "Computer"
      if check_winner?(add_checker(lowest_position(random_column)))
        winner = @player
      end
    else
      if check_winner?(add_checker(lowest_position(get_input)))
        winner = @player
      end
    end

    winner
  end

  def connect_four?(four_cells)
    checkers = []
    winner = false

    four_cells.each do |cell|
      checkers << cell[1][:checker]
    end
    
    if checkers.uniq.size == 1 && !checkers.include?(nil)
      winner = true
    end

    winner
  end

  def winner_row?(checker)
    row = @board.layout[checker][:row]
    column = @board.layout[checker][:column]

    #Create a hash of each element in a row
    row_set = @board.layout.select do |cell| #=> {}
      @board.layout[cell][:row] == row
    end

    #Create an array of the sets of four cells in a row
    sets_of_four = []
    row_set.each_cons(4) do |set_of_four|
      sets_of_four << set_of_four
    end

    #Create an array of the sets of four cells that contain the dropped checker
    checker_sets = []
    sets_of_four.each do |checker_set|

      contains_checker = false
      checker_set.each do |cell|
        if @board.layout[cell[0]][:column] == column
          contains_checker = true
        end
      end

      if contains_checker
        checker_sets << checker_set
      end
    end

    #Determine if there is a row win condition containing the last checker dropped
    winner = false
    checker_sets.each do |set|
      if connect_four?(set)
        winner = true
      end
    end

    winner
  end

  def winner_column?(checker)
    row = @board.layout[checker][:row]
    column = @board.layout[checker][:column]

    #Create a hash of each element in a column
    column_set = @board.layout.select do |cell| #=> {}
      @board.layout[cell][:column] == column
    end

    #Create an array of the sets of four cells in a column
    sets_of_four = []
    column_set.each_cons(4) do |set_of_four|
      sets_of_four << set_of_four
    end

    #Create an array of the sets of four cells that contain the dropped checker
    checker_sets = []
    sets_of_four.each do |checker_set|

      contains_checker = false
      checker_set.each do |cell|
        if @board.layout[cell[0]][:row] == row
          contains_checker = true
        end
      end

      if contains_checker
        checker_sets << checker_set
      end
    end

    #Determine if there is a column win condition containing the last checker dropped
    winner = false
    checker_sets.each do |set|
      if connect_four?(set)
        winner = true
      end
    end
    
    winner
  end

  def winner_down_diag?(checker)
    row = @board.layout[checker][:row]
    column = @board.layout[checker][:column]
    diagonal_keys = [checker]

    columns = ["A", "B", "C", "D", "E", "F", "G"] # <= Consider #Hash implementation

    #Collect upper-left portion of the diagonal set
    until (row + 1) > 6 || (column - 1) < 1
      set_cell = (columns[column - 2] + (row + 1).to_s).to_sym
      diagonal_keys << set_cell
      row += 1
      column -= 1
    end
    
    #Resets row and column to starting cell
    row = @board.layout[checker][:row]
    column = @board.layout[checker][:column]

    #Collect lower-right portion of the diagonal set
    until (row - 1) < 1 || (column + 1) > 7
      set_cell = (columns[column] + (row - 1).to_s).to_sym
      diagonal_keys << set_cell
      row -= 1
      column += 1
    end

    #Resets row and column to starting cell
    row = @board.layout[checker][:row]
    column = @board.layout[checker][:column]

    #Create a hash of each cell, in order, from left => right
    diagonal_set = {}
    diagonal_keys.sort.each do |cell|
      diagonal_set[cell] = @board.layout[cell]
    end

    #Create an array of the sets of four cells in a diagonal
    sets_of_four = []
    diagonal_set.each_cons(4) do |set_of_four|
      sets_of_four << set_of_four
    end

    #Create an array of the sets of four cells that contain the dropped checker
    checker_sets = []
    sets_of_four.each do |checker_set|

      contains_checker = false
      checker_set.each do |cell|
        if @board.layout[cell[0]][:row] == row && @board.layout[cell[0]][:column] == column
          contains_checker = true
        end
      end

      if contains_checker
        checker_sets << checker_set
      end
    end

    #Determine if there is a diagonal down win condition containing the last checker dropped
    winner = false
    checker_sets.each do |set|
      if connect_four?(set)
        winner = true
      end
    end
    
    winner
  end

  def winner_up_diag?(checker)
    row = @board.layout[checker][:row]
    column = @board.layout[checker][:column]
    diagonal_keys = [checker]

    columns = ["A", "B", "C", "D", "E", "F", "G"] # <= Consider #Hash implementation

    #Collect upper-right portion of the diagonal set
    until (row + 1) > 6 || (column + 1) > 7
      set_cell = (columns[column] + (row + 1).to_s).to_sym
      diagonal_keys << set_cell
      row += 1
      column += 1
    end
    
    #Resets row and column to starting cell
    row = @board.layout[checker][:row]
    column = @board.layout[checker][:column]

    #Collect lower-left portion of the diagonal set
    until (row - 1) < 1 || (column - 1) < 1
      set_cell = (columns[column - 2] + (row - 1).to_s).to_sym
      diagonal_keys << set_cell
      row -= 1
      column -= 1
    end

    #Resets row and column to starting cell
    row = @board.layout[checker][:row]
    column = @board.layout[checker][:column]

    #Create a hash of each cell, in order, from left => right
    diagonal_set = {}
    diagonal_keys.sort.each do |cell|
      diagonal_set[cell] = @board.layout[cell]
    end

    #Create an array of the sets of four cells in a diagonal
    sets_of_four = []
    diagonal_set.each_cons(4) do |set_of_four|
      sets_of_four << set_of_four
    end

    #Create an array of the sets of four cells that contain the dropped checker
    checker_sets = []
    sets_of_four.each do |checker_set|

      contains_checker = false
      checker_set.each do |cell|
        if @board.layout[cell[0]][:row] == row && @board.layout[cell[0]][:column] == column
          contains_checker = true
        end
      end

      if contains_checker
        checker_sets << checker_set
      end
    end

    #Determine if there is a diagonal up win condition containing the last checker dropped
    winner = false
    checker_sets.each do |set|
      if connect_four?(set)
        winner = true
      end
    end
    
    winner
  end

  def check_winner?(cell)
    winner_row?(cell) || winner_column?(cell) || winner_down_diag?(cell) || winner_up_diag?(cell)
  end
end