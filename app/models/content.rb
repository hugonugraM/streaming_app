class Content < ApplicationRecord
  validates_presence_of :title, :plot, :content_type
  validate :number_for_seasons
  validates :number, uniqueness: {scope: [:title]}

  has_many :episodes, foreign_key: "season_id", class_name: "Episode" #it will happen just with seasons

  scope :movies, -> { where(content_type: 'm') }
  scope :seasons, -> { where(content_type: 's') }

  def number_for_seasons
    if (self.content_type == 's' && self.number.nil?)
      errors.add(:number, "A season must have a number")
    end
  end
end
