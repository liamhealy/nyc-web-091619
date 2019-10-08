class AddHeroIdToSuperpowers < ActiveRecord::Migration[5.2]
  def change
    add_column :superpowers, :hero_id, :integer
  end
end
