class Superpower < ActiveRecord::Base
  has_many :hero_superpowers
  has_many :heroes, through: :hero_superpowers
end