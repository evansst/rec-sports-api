class CreateStandings < ActiveRecord::Migration[6.0]
  def change
    create_table :standings do |t|
      t.references :team, null: false, foreign_key: true
      t.references :season, null: false, foreign_key: true
      t.integer :points

      t.timestamps
    end
  end
end
