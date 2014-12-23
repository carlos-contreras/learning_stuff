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
    ranking = Ranking.new(
      player1: "player1",
      player2: "player2",
      winner: "player2",
      winner_reamaining_points: 20)
    expect(ranking).to be_valid
  end
  it "is invalid without player1" do
    ranking = Ranking.new(
      player1: nil,
      player2: "player2",
      winner: "player2",
      winner_reamaining_points: 20)
    ranking.valid?
    expect(ranking.errors[:player1]).to include("can't be blank")
  end
  it "is invalid without player2" do
    ranking = Ranking.new(
      player1: "player1",
      player2: nil,
      winner: "player2",
      winner_reamaining_points: 20)
    ranking.valid?
    expect(ranking.errors[:player2]).to include("can't be blank")
  end
  it "is invalid without winner" do
    ranking = Ranking.new(
      player1: "player1",
      player2: "player2",      
      winner: nil,
      winner_reamaining_points: 20)
    ranking.valid?
    expect(ranking.errors[:winner]).to include("can't be blank")
  end
  it "is invalid without winner_reamaining_points" do
    ranking = Ranking.new(
      player1: "player1",
      player2: "player2",
      winner: "player2",
      winner_reamaining_points: nil)
    ranking.valid?
    expect(ranking.errors[:winner_reamaining_points]).to include("can't be blank")
  end
  it "has a winner that is one of the players" do
     ranking = Ranking.new(
      player1: "player1",
      player2: "player2",
      winner: "someone",
      winner_reamaining_points: 20)
     ranking.valid?
     expect(ranking.errors[:winner]).to include("is not a player")
  end
end