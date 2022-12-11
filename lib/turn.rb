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
      puts "✧･ﾟ:* Select A Column *:･ﾟ✧"
      puts " A - B - C - D - E - F - G"
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
  end

  def play_turn
    if @player.name == "Computer"
      add_checker(lowest_position(random_column))
    else
      add_checker(lowest_position(get_input))
    end

    #Iteration 3 check_winner?
    #check_winner?(cell)
  end
end