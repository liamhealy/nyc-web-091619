class DropPowerLevelAndHeroIdFromSuperpowers < ActiveRecord::Migration[5.2]
  def change
    remove_column :superpowers, :hero_id, :integer
    remove_column :superpowers, :power_level, :integer
  end
end
