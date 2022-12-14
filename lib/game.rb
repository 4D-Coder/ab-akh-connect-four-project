class Game
    attr_reader :board,
                :player,
                :computer

    def initialize
        @board = Board.new
        @player1 = Player.new("Player", "X")
        @player2 = Player.new("Computer", "O")
    end

    def welcome_user
       "              Welcome to CONNECT FOUR"
    end

    def print_board
        # Create board string accumulator 
        board_string = " A  B  C  D  E  F  G\n"
        counter = 6

        # Add each board cell's checker value to string in reverse row order, starting at 6
        6.times do
            
            # Create a hash of each key:value pair of the row corresponding to the counter
            row_string = @board.layout.select do |cell|
                @board.layout[cell][:row] == counter
            end
           
            # Add each checker piece or '.' to the string accumulator
            row_string.each do |cell|
                if cell[1][:checker] != nil
                    board_string << " #{cell[1][:checker]} "
                else
                    board_string << " . "
                end
            end
            
            # Add line break to end of string accumulator
            board_string << "\n"

            counter -= 1
        end
        board_string
    end

    def start
        # Get total number of user players and request names
        if get_number_of_players == "1"
            puts "Player 1: Enter your name"
            @player1.change_name(get_user_name)
        else
            puts "Player 1: Enter your name: "
            @player1.change_name(get_user_name)
            puts

            puts "Player 2: Enter your name "
            @player2.change_name(get_user_name)
            puts
        end

        puts print_board
        puts

        turn = Turn.new(@board, @player1)
        winner = nil
        
        # Play until the board is full or a win condition is made
        until turn.board_full?
            turn = Turn.new(@board, @player1)
            winner = turn.play_turn
            puts print_board
            puts
            break if winner != nil
    
            turn = Turn.new(@board, @player2)
            winner = turn.play_turn
            puts print_board
            puts
            break if winner != nil
        end
        
        #Print the appropriate winner response
        if winner == nil
            "The game was a DRAW, how could this have happened??"
        elsif winner.name == "Computer"
            "The computer won selecting at random, wow."
        elsif winner == @player1
            "Congratulations #{@player1.name}, you win!"
        else
            "Congratulations #{@player2.name}, you win!"
        end
    end

    def get_number_of_players
        input = ""

        until input == '1' || input == '2'
            puts "Please select '1' for single player against computer"
            puts "                       OR"
            puts "           Select '2' for two player"
            puts " _-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_"
            input = gets.chomp
        end
        
        input
    end

    def get_user_name
        input = gets.chomp
        puts "Good luck, #{input}!"
        puts
        input
    end
end