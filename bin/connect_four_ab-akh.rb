#!/usr/bin/env ruby

require './lib/board'
require './lib/turn'
require './lib/game'
require './lib/player'

input = ""

until input == 'q'
    puts
    puts " ---------------------------------------------------"
    puts "|       Enter 'p' to play OR Enter 'q' to quit      |"
    puts " ---------------------------------------------------"
    input = gets.chomp

    if input == 'q'
        break
    elsif input == 'p'
        game = Game.new

        puts
        puts game.welcome_user
        puts "----------------------------------------------------"
        puts game.start
        puts

        input = ""
    else
        "Invalid input"
    end
end