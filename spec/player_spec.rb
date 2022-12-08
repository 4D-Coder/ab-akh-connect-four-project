require './lib/player'

describe Player do
    context 'Iteration 2' do
        before(:each) do
            @player = Player.new
        end

        it '1. Can create an instance' do
            expect(@player).to be_a(Player)
        end
    end
end