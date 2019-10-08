class CreateHeroesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :heroes do |t|
      t.string :name
      t.timestamps
    end
  end
end
