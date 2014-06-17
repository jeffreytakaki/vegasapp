class AddTransportationColToUsers < ActiveRecord::Migration
  def change
    add_column :users, :Transportation, :string
  end
end
