class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :guest
      t.boolean :mgm
      t.string :days

      t.timestamps
    end
  end
end
