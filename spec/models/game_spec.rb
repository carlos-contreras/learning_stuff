require 'spec_helper'

RSpec.describe Game do

  before :all do
    @game = Game.new('Carlos', 'Charly')
  end

  it 'respond to some methods' do
    expect(@game).to respond_to(:player1, :player2, :which_turn, :turn_counter)
  end

  describe '#new' do
    it 'takes two parameters and returns a Game object' do
      expect(@game).to be_kind_of(Game)
    end
    it 'Takes the Player 1 name, as the first parameter' do
      expect(@game.player1.name).to eq('Carlos')
    end
    it 'Takes the Player 2 name, as the second parameter' do
      expect(@game.player2.name).to eq('Charly')
    end
    it 'Set the turns counter to zero' do
      expect(@game.turn_counter).to eq(0)
    end
  end

end