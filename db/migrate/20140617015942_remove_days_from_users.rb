class RemoveDaysFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :days, :string
  end
end
