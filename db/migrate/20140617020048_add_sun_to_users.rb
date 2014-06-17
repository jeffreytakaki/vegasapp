class AddSunToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sun, :boolean
  end
end
