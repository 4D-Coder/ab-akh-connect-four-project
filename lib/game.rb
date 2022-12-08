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
        board_string = "ABCDEFG\n"

        6.times do
            counter = 6
    
            row_string = @board.layout.select do |cell|
                @board.layout[cell][:row] == counter
            end
            
            row_string.each do |cell|
                if cell[1][:checker] != nil
                    board_string << cell[1][:checker].type
                else
                    board_string << "."
                end
            end
    
            board_string << "\n"
            counter -= 1
        end
        return board_string
    end
end