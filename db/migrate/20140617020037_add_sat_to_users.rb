class AddSatToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sat, :boolean
  end
end
