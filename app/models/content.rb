class Content < ApplicationRecord
  has_many :episodes #it will happen just with seasons

  scope :movies, -> { where(is_a_season: 'm') }
  scope :seasons, -> { where(is_a_season: 's') }
  validate :number_for_seasons

  def number_for_seasons
    if (self.type == 's' && self.number.nil?)
      errors.add(:number, "A season must have a number")
    end
  end
end
