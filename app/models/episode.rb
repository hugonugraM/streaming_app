class Episode < ApplicationRecord
  validates_presence_of :title, :plot, :number
  validates :number, uniqueness: {scope: [:season]}
  validates :title, uniqueness: {scope: [:season]}

  belongs_to :season, class_name: "Content", foreign_key: "season_id", validate: true
end
