class Tokimon < ApplicationRecord

  validates(:name, presence: true)
  validates(:weight, presence: true)
  validates(:height, presence: true)
  validates(:defense, presence: true)
  validates(:health, presence: true)
  validates(:fly, presence: true)
  validates(:fight, presence: true)
  validates(:fire, presence: true)
  validates(:water, presence: true)
  validates(:electric, presence: true)
  validates(:ice, presence: true)
  validates(:psychic, presence: true)
  validates(:total, presence: true)

  def self.RemoveID(id)
    tokimon_all = Tokimon.where(:trainer_id => id)
    tokimon_all each do |t|
      t.trainer_id = -1
    end
  end
  def self.getAll(id)
    return Tokimon.where(:trainer_id => id).name
  end
  def self.setTotal(t)
    t.total = t.fly + t.fight + t.fire + t.water + t.electric + t.ice + t.psychic
  end
end
