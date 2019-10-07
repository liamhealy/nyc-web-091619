class AddClownsTable < ActiveRecord::Migration
  def change
    create_table :clowns do |t|
      t.string :name
      t.integer :scariness
      t.timestamps
    end
  end
end
