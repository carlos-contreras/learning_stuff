class CreateRankings < ActiveRecord::Migration
  def change
    create_table :rankings do |t|
      t.string :player1
      t.string :player2
      t.string :winner
      t.integer :winner_reamaining_points

      t.timestamps
    end
  end
end
