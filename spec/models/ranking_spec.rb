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
  it "is valid with player1, player2, winner, winner_reamaining_points" do
    expect(FactoryGirl.build(:ranking)).to be_valid
  end
  it "is invalid without player1" do
    ranking = FactoryGirl.build(:ranking, player1: nil)
    ranking.valid?
    expect(ranking.errors[:player1]).to include("can't be blank")
  end
  it "is invalid without player2" do
    ranking = FactoryGirl.build(:ranking, player2: nil)
    ranking.valid?
    expect(ranking.errors[:player2]).to include("can't be blank")
  end
  it "is invalid without winner" do
    ranking = FactoryGirl.build(:ranking, winner: nil)
    ranking.valid?
    expect(ranking.errors[:winner]).to include("can't be blank")
  end
  it "is invalid without winner_reamaining_points" do
    ranking = FactoryGirl.build(:ranking, winner_reamaining_points: nil)
    ranking.valid?
    expect(ranking.errors[:winner_reamaining_points]).to include("can't be blank")
  end
  it "has a winner that is one of the players" do
     ranking = FactoryGirl.build(:ranking, winner: "someone")
     ranking.valid?
     expect(ranking.errors[:winner]).to include("is not a player")
  end
end