require './lib/checker'

describe Checker do
    context 'Iteration 1' do
        before(:each) do
            @checker = Checker.new("O")
        end

        it '1. Can create an instance' do
            expect(@checker).to be_a(Checker)
        end

        it '2. Can be an x or o' do
            expect(@checker.type).to eq("O")

            @checker = Checker.new("X")
            expect(@checker.type).to eq("X")
        end
    end
end