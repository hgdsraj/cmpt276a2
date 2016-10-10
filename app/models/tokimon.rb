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
  validates(:psychic, presence: true)

  belongs_to :trainers
end
