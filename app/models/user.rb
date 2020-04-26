class User < ApplicationRecord
  validates_presence_of :email

  has_many :purchase_options
  has_many :contents, -> { distinct }, through: :purchase_options
end
