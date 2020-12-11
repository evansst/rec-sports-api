class AddNameTo < ActiveRecord::Migration[6.0]
  def change
    add_column :seasons, :name, :string
  end
end
