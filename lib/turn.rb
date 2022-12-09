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
end