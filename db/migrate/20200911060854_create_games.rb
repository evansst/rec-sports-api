class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.integer :home_team, null: false
      t.integer :away_team, null: false
      t.integer :home_team_score
      t.integer :away_team_score
      t.references :season, null: false, foreign_key: true

      t.timestamps
    end
  end
end
