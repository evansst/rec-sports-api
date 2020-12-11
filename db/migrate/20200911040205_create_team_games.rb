class CreateTeamGames < ActiveRecord::Migration[6.0]
  def change
    create_table :team_games do |t|
      t.references :team, null: false, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
