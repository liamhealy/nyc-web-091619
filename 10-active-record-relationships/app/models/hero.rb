class Hero < ActiveRecord::Base
  has_many :hero_superpowers
  has_many :superpowers, through: :hero_superpowers

  def set_power_level(superpower, level)
    self.hero_superpowers.find_by(superpower: superpower).update(power_level: level)
  end

  
end