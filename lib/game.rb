class Game
    attr_reader :board,
                :player,
                :computer

    def initialize
        @board = Board.new
        @player = Player.new("Player", "X")
        @computer = Player.new("Computer", "O")
    end

    # def start
    #     puts welcome_user
    #     puts print_board
    # end

    def welcome_user
       "Welcome to CONNECT FOUR"
    end

    def print_board
        # Create board string accumulator 
        board_string = "ABCDEFG\n"
        counter = 6

        # Add each board cell's checker value to string in reverse row order, starting at 6
        6.times do
            
            # Create a hash of each key:value pair of the row corresponding to the counter
            row_string = @board.layout.select do |cell|
                @board.layout[cell][:row] == counter
            end
            #require "pry"; binding.pry
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
        board_string
    end

    def start
        puts print_board

        turn = Turn.new(@board, @player)
        winner = nil
    
        until turn.board_full?
            turn = Turn.new(@board, @player)
            winner = turn.play_turn
            puts print_board
            puts
            break if winner != nil
    
            turn = Turn.new(@board, @computer)
            winner = turn.play_turn
            puts print_board
            puts
            break if winner != nil
        end
        
        if winner == @player
            puts "Congratulations #{@player.name}, you win!"
        elsif winner == @computer
            puts "Sorry #{@player.name}, you lose!"
        else
            "The game was a DRAW, you couldn't beat a computer choosing at random"
        end
    end
end