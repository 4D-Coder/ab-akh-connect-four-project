require './lib/player'

describe Player do
    context 'Iteration 2' do
        before(:each) do
            @player = Player.new("Player", "X")
        end

        it '1. Can create an instance' do
            expect(@player).to be_a(Player)
        end

        it '2. Has readable attributes' do
            expect(@player.checker).to eq("X")
            expect(@player.name).to eq("Player")
        end
    end
end