class Board
  attr_reader :layout

  def initialize
    @layout = build_board
  end

  def build_board
    new_board = {}
    col = ["A", "B", "C", "D", "E", "F", "G"]

    #Creates 7 columns
    7.times do |i|

        #Creates 6 rows
        6.times do |j|
            #Determine row
            row = j + 1

            #Creates the key symbol for new_board hash
            key = col[i] + row.to_s

            #Putting key => value pair into new_board hash
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