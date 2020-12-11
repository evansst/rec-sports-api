class CreateParticipatesIns < ActiveRecord::Migration[6.0]
  def change
    create_table :participates_ins do |t|
      t.references :player, null: false, foreign_key: true
      t.references :team_game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
