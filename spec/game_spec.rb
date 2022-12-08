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
end