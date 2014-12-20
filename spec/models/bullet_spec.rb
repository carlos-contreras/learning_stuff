require 'spec_helper'

RSpec.describe Bullet do
  before :all do
    @bullet = Bullet.generate_bullet
  end

  describe '.generate_bullet' do
    it 'returns a Fixnum' do
      expect(@bullet).to be_kind_of(Fixnum)
    end
    it 'returns a non zero value' do
      expect(@bullet).not_to eq(0)
    end 
    it 'returns a value equal or lower than 25' do
      expect(@bullet).to be<=25
    end
  end
end