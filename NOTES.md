```ruby
#Runner file

game = Game.new

game.welcome_user
input = ""

until input == 'q'
    puts "Enter p to play. Enter q to quit"
    input = gets.chomp

    if input == 'q'
        break
    elsif input == 'p'
        game.start()
    else
        "Invalid input"
    end

end

#### Game class
@player
@computer
@board

#Iteration 2
def start
    puts print_board
    winner = "Draw"
    turn = Turn.new(@board, @player)

    until @turn.board_full?
        turn = Turn.new(@board, @player)
        turn.play_turn

        turn = Turn.new(@board, @computer)
        turn.play_turn
    end

    announce_winner(winner)

end
#Iteration 3
def start
    puts print_board
    winner = "Draw"
    turn = Turn.new(@board, @player)

    until @turn.board_full?
        turn = Turn.new(@board, @player)

        if turn.play_turn
            winner = @player.name
            break
        end

        turn = Turn.new(@board, @computer)

        if turn.play_turn
            winner = @computer.name
            break
        end    
    end

    announce_winner(winner)

end

#Turn class
def play_turn
    #Code for Iteration 2



    # is_winner? Iteration 3
end
```

    

    