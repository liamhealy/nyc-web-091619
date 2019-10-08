class HeroSuperpower < ActiveRecord::Base
  belongs_to :hero
  belongs_to :superpower
end