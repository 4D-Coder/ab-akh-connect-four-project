require './lib/board'

class Turn 
  attr_reader :board, :turn

  def initialize
    @turn = turn
    @board = Board.new
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
end