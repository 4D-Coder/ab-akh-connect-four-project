require './lib/game'


describe Game do
    before(:each) do 
        @game = Game.new
    end
    
    it '1. Can create an instance' do
        expect(@game).to be_a(Game)
    end

    it '2. has readable attributes' do
        expect(@game.board).to eq({})
    end

    it '3. can get welcome message' do
        expect(@game.welcome_user).to eq("Welcome to CONNECT FOUR")
    end
end