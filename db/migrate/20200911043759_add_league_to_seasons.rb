class AddLeagueToSeasons < ActiveRecord::Migration[6.0]
  def change
    add_reference :seasons, :league, null: false, foreign_key: true
  end
end
