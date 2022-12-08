require './lib/game'


describe Game do
    before(:each) do 
        @game = Game.new
    end
    
    it '1. Can create an instance' do
        expect(@game).to be_a(Game)
    end

    it '2. has readable attributes' do
        expect(@game.board).to be_a(Board)
    end

    it '3. can get welcome message' do
        expect(@game.welcome_user).to eq("Welcome to CONNECT FOUR")
    end

    it '4. can print board' do
        expect(@game.print_board).to eq("ABCDEFG\n.......\n.......\n.......\n.......\n.......\n.......\n")
    end
end

require './lib/game'
require './lib/board'
require './lib/checker'
game = Game.new