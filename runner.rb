require './lib/board'
require './lib/turn'
require './lib/game'
require './lib/player'

game = Game.new

puts game.welcome_user
input = ""

until input == 'q'
    puts "Enter p to play. Enter q to quit"
    input = gets.chomp

    if input == 'q'
        break
    elsif input == 'p'
        puts game.start
    else
        "Invalid input"
    end
end

