class ChangeHeroesTableToHeros < ActiveRecord::Migration[5.2]
  def up
    rename_table :heroes, :heros
  end

  def down
    rename_table :heros, :heroes
  end
end
