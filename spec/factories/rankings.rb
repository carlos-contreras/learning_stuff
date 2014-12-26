FactoryGirl.define do
  factory :ranking do
    player1 { Faker::Name.first_name }
    player2 { Faker::Name.first_name }
    winner { player1 }
    winner_reamaining_points 20
  end
end