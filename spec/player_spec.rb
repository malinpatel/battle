require 'player'

describe Player do

  subject(:player) {described_class.new("Mal")}

    describe '#name' do
      it "should return player's name" do
        expect(player.name).to eq "Mal"
      end
    end
end
