require 'spec_helper'

RSpec.describe Bullet do
  before :all do
    @bullet = Bullet.new
  end

  it 'respond to some methods' do
    expect(@bullet).to respond_to(:points, :bonus, :total_value)
  end

  describe '#new' do
    it 'return Bullet object' do
      expect(@bullet).to be_kind_of(Bullet)
    end
    it 'has a points attribute of FixNum type' do
      expect(@bullet.points).to be_kind_of(Fixnum)
    end
    it 'has a bonus attribute of Fixnum type' do
      expect(@bullet.bonus).to be_kind_of(Fixnum)
    end
    it 'has points within 1 and 5' do
      expect(@bullet.points).to be>=1 && be<=5
    end
    it 'has one bonus of any of this [0,2,5,10,20]' do
      expect(@bullet.bonus).to satisfy { |value| [0,2,5,10,20].include?(value) }
    end
  end

  describe '#total_value' do
    it 'need to return the sum of points and bonus' do
      expect(@bullet.total_value).to be == (@bullet.points + @bullet.bonus)
    end
  end
end