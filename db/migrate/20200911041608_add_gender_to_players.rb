class AddGenderToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :gender, :string
    add_column :teams, :color, :string
  end
end
