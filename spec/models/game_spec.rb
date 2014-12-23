require 'rails_helper'

RSpec.describe Game do

  before do
    @game = Game.new('Player 1', 'Player 2')
  end

  it 'respond to some methods' do
    expect(@game).to respond_to(:player1, :player2, :which_turn, :move, :winner?, :status)
  end

  describe '#new' do
    before :each do
      @game = Game.new('Player 1', 'Player 2')
    end
    context 'when it takes two non empty string parameters' do
      it 'takes two parameters and returns a Game object' do
        expect(@game).to be_kind_of(Game)
      end
      it 'takes the player1 name, as the first parameter' do
        expect(@game.player1.name).to eq('Player 1')
      end
      it 'takes the player2 name, as the second parameter' do
        expect(@game.player2.name).to eq('Player 2')
      end
      it 'set the turns counter to zero' do
        expect(@game.turn_counter).to eq(0)
      end
      it 'set the winner to nil' do
        expect(@game.winner).to eq(nil)
      end
    end

    context 'when no prameters are passed' do
      before :each do
        @game = Game.new
      end
      it 'takes two parameters and returns a Game object' do
        expect(@game).to be_kind_of(Game)
      end
      it 'takes the Player 1 name, as the first parameter' do
        expect(@game.player1.name).to eq('Player1')
      end
      it 'takes the Player 2 name, as the second parameter' do
        expect(@game.player2.name).to eq('Player2')
      end
      it 'set the turns counter to zero' do
        expect(@game.turn_counter).to eq(0)
      end
      it 'set the winner to nil' do
        expect(@game.winner).to eq(nil)
      end
    end

    context 'when two empty strings are passed' do
      before :each do
        @game = Game.new "", ""
      end
      it 'takes two parameters and returns a Game object' do
        expect(@game).to be_kind_of(Game)
      end
      it 'takes the Player 1 name, as the first parameter' do
        expect(@game.player1.name).to eq('Player1')
      end
      it 'takes the Player 2 name, as the second parameter' do
        expect(@game.player2.name).to eq('Player2')
      end
      it 'set the turns counter to zero' do
        expect(@game.turn_counter).to eq(0)
      end
      it 'set the winner to nil' do
        expect(@game.winner).to eq(nil)
      end
    end
  end

  describe '#move' do
    before :each do
      @aux = @game.player1.wall_health + @game.player2.wall_health
      @bullet = @game.move
    end

    it 'has to reduce either player wall health' do
      result = @game.player1.wall_health + @game.player2.wall_health
      expect(@aux).to be>result
    end

    it 'has to return the bullet value in points as a Fixnum' do
      expect(@bullet).to be_kind_of(Fixnum)
    end

    it ' the value of the bullet need to meet the reduction to the player' do
      result = @game.player1.wall_health + @game.player2.wall_health
      @aux -= @bullet
      expect(result).to eq(@aux)
    end
  end

end