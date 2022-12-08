require './lib/board'

class Turn 
  attr_reader :board

  def initialize
    @board = Board.new
  end

end