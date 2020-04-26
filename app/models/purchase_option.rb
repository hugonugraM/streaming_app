class PurchaseOption < ApplicationRecord
  validates_presence_of :quality, :price

  belongs_to :content
  has_many :purchases
end
