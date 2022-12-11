require './lib/board'
require './lib/turn'
require './lib/game'
require './lib/player'

input = ""

until input == 'q'
    puts "Enter p to play. Enter q to quit"
    input = gets.chomp

    if input == 'q'
        break
    elsif input == 'p'
        game = Game.new

        puts game.welcome_user
        puts game.start
        puts

        input = ""
    else
        "Invalid input"
    end
end