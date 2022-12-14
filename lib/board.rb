class Board
  attr_reader :layout

  def initialize
    @layout = build_board
  end

  def build_board
    new_board = {}
    col = ["A", "B", "C", "D", "E", "F", "G"]

    7.times do |i|
      6.times do |j|
        row = j + 1

        key = col[i] + row.to_s

        new_board[key.to_sym] = {
          column: i+1,
          row: row,
          checker: nil
        }
      end
    end
    new_board
  end
end