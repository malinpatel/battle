require 'game'
require 'player'

describe Game do

  let(:player1) { double(:player1, hitpoints: 100) }
  let(:player2) { spy(:player2, name: "Mal", hitpoints: 100) }

  subject(:game) { described_class.new(player1, player2) }

  describe 'attack' do

    it "reduces the attacked player's hitpoints by 10" do
      game.attack
      expect(player2.to have_received(:reduce_hitpoints).with(10))
    end
  end

    describe '#switch_turn' do
      it 'checks if players can take turns attacking' do
        expect(game.current_turn).to eq player1
      end

      it 'chages turn to player2 when player1 attacks' do
        game.switch_turn(player1)
        expect(game.current_turn).to eq player2
      end

      it "should switch turns after an attack" do
        game.attack
        expect(game.current_turn).to eq player2
      end
    end

    describe '#lose' do
      before do
        allow(player2).to receive(:hitpoints) {0}
      end

      it "should display loser message" do
        expect(game.lose).to eq "Mal has lost!"
      end
    end

end
