require 'spec_helper'

RSpec.describe Player do

  before :all do
    @player = Player.new "Name"
  end
  it 'respond to some methods' do
    expect(@player).to respond_to(:name, :wall_health, :reduce_wall, :status)
  end

  describe '#new' do
    context 'With parameters' do
      it 'takes two parameters and returns a Player object' do
        expect(@player).to be_kind_of(Player)
      end
      it 'takes a name and assign it to the name attribute' do
        expect(@player.name).to eq('Name') 
      end
      it 'takes a integer and assign it to the wall health attribute' do
        expect(@player.wall_health).to eq(100) 
      end
    end

    context 'Without parameters' do
      before :each do
        @player = Player.new
      end
      it 'takes no parameters and returns a Player object' do
        expect(@player).to be_kind_of(Player)
      end
      it 'takes a name and assign it to the name attribute' do
         expect(@player.name).to eq('Player') 
      end
      it 'takes a integer and assign it to the wall health attribute' do
        expect(@player.wall_health).to eq(100) 
      end
    end
  end

  describe '#take_damage' do
    context 'When the result is greater that zero' do
      it 'take a single parameter and decrement the wall health to 80' do
        @player.reduce_wall(20)
        expect(@player.wall_health).to eq(80) 
      end
    end

    context 'When the result is zero' do
      it 'reduces the wall healt to zero' do
        @player.reduce_wall(100)
        expect(@player.wall_health).to eq(0)
      end

      it 'reduces the wall healt to zero even if the damage is greater' do
        @player.reduce_wall(120)
        expect(@player.wall_health).to eq(0) 
      end
    end
  end

  describe '#status' do
    it 'returns the status of the player on a specific format' do
      expect(@player.status).to eq("#{@player.name}: #{@player.wall_health}")
    end
  end
end