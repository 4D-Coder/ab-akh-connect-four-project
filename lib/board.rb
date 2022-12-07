class Board
  attr_reader :layout

  def initialize
    @layout = build_board
  end

  def build_board
    new_board = {}
    row = 0
    column = ""
    key = ""
    value = []

    #Creates 7 columns
    7.times do |i|
      column = ["A", "B", "C", "D", "E", "F", "G"]

      #Creates 6 rows
      6.times do |j|
        #Determine rows
        row = j + 1

        #Creates the keys and values for new_board hash
        key = column[i] + row.to_s
        value = [i + 1, row, nil]

        #Putting key => value pair into new_board hash
        new_board[key.to_sym] = value 

      end
    end
    new_board
  end
end