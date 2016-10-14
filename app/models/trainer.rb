class Trainer < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :name,  presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_many :tokimons
  validates(:level, presence: true)
  def self.SetLevel(trainer)
    tokimon_amount = Tokimon.where(:trainer_id => trainer.id)
    trainer.level = tokimon_amount.length / 3
    trainer.save
  end


end
