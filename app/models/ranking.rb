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

class Ranking < ActiveRecord::Base
  validates :player1, presence: true
  validates :player2, presence: true
  validates :winner, presence: true
  validates :winner_reamaining_points, presence: true
end
