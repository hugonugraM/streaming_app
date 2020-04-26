class Episode < ApplicationRecord
  validates_presence_of :title, :plot, :number

  belongs_to :season, class_name: 'Content', foreign_key: 'season_id', validate: true
end
