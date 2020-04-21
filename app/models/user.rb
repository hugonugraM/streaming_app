class User < ApplicationRecord
  has_many :purchase_options
  has_many :contents, -> { distinct }, through: :purchase_options,
end
