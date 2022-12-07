require './lib/checker'

describe Checker do
    context 'Iteration 1' do
        before(:each) do
            @checker = Checker.new("O")
        end

        it 'exists' do
            expect(@checker).to be_a(Checker)
        end

        it 'can be an x or o' do
            expect(@checker.type).to eq("O")

            @checker = Checker.new("X")
            expect(@checker.type).to eq("X")
        end
    end
end