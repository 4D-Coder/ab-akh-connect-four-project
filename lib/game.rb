class Game
    attr_reader :board

    def initialize
        @board = Board.new
    end

    def start
        puts welcome_user
        puts print_board
    end

    def welcome_user
       "Welcome to CONNECT FOUR"
    end

    def print_board
        # Create board string accumulator 
        board_string = "ABCDEFG\n"

        # Add each board cell's checker value to string in reverse row order, starting at 6
        6.times do
            counter = 6
            
            # Create a hash of each key:value pair of the row corresponding to the counter
            row_string = @board.layout.select do |cell|
                @board.layout[cell][:row] == counter
            end
            
            # Add each checker piece or '.' to the string accumulator
            row_string.each do |cell|
                if cell[1][:checker] != nil
                    board_string << cell[1][:checker]
                else
                    board_string << "."
                end
            end
            
            # Add line break to end of string accumulator
            board_string << "\n"
            
            counter -= 1
        end
        return board_string
    end
end