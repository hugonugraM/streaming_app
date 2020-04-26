class User < ApplicationRecord
  validates_presence_of :email

  has_many :purchases
  has_many :purchase_options, through: :purchases
  has_many :contents, -> { distinct }, through: :purchase_options
end
