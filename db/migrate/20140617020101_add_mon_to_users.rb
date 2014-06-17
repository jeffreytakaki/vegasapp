class AddMonToUsers < ActiveRecord::Migration
  def change
    add_column :users, :mon, :boolean
  end
end
