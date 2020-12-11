class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :name
      t.string :username
      t.string :password_digest
      t.string :email_address

      t.timestamps
    end
  end
end
