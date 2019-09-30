class CreateSuperpowersTable < ActiveRecord::Migration[5.2]
  def up
    create_table :superpowers do |table|
      table.string :name
      table.integer :power_level
      table.string :description
      table.timestamps
    end
  end

  def down
    drop_table :superpowers
  end
end
