class Tokimon < ApplicationRecord

  validates(:name, presence: true)
  validates(:weight, presence: true, numericality: true)
  validates(:height, presence: true, numericality: true)
  validates(:defense, presence: true, numericality: true)
  validates(:health, presence: true, numericality: true)
  validates(:fly, presence: true, numericality: true)
  validates(:fight, presence: true, numericality: true)
  validates(:fire, presence: true, numericality: true)
  validates(:water, presence: true, numericality: true)
  validates(:electric, presence: true, numericality: true)
  validates(:ice, presence: true, numericality: true)
  validates(:psychic, presence: true, numericality: true)
  validates(:total, presence: true)
  validates(:trainer_id, presence: true)
  belongs_to :trainer

  def self.RemoveID(id)
    tokimon_all = Tokimon.where(:trainer_id => id)
    tokimon_all each do |t|
      t.trainer_id = -1
    end
  end
  def self.getAll(id)
    return Tokimon.where(:trainer_id => id).name
  end
  def self.getTotal(t)
    return t.total
  end
  def self.setTotal(t)
    total = t.fly + t.fight + t.fire + t.water + t.electric + t.ice + t.psychic
    return total
  end
  def self.getAllAt(t)
    all = Tokimon.where(:trainer_id => t.id)
    g = Array.new()
    all.each do |a|
      g.push(a.name)
    end
    return g
  end
end
