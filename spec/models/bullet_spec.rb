require 'spec_helper'

RSpec.describe Bullet do
  before :all do
    @bullet = Bullet.generate_bullet
  end

  describe '.generate_bullet' do
    it 'returns a Fixnum' do
      expect(@bullet).to be_kind_of(Fixnum)
    end
  end

end