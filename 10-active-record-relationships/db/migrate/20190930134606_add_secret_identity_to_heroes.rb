class AddSecretIdentityToHeroes < ActiveRecord::Migration[5.2]
  def change
    add_column :heroes, :secret_identity, :string 
  end
end
