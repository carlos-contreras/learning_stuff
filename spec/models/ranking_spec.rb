# == Schema Information
#
# Table name: rankings
#
#  id                       :integer          not null, primary key
#  player1                  :string(255)
#  player2                  :string(255)
#  winner                   :string(255)
#  winner_reamaining_points :integer
#  created_at               :datetime
#  updated_at               :datetime
#

require 'rails_helper'

RSpec.describe Ranking, :type => :model do
  it "return a object of type Ranking" do  
    @ranking = Ranking.new
    expect(@ranking).to be_kind_of(Ranking)
  end
end