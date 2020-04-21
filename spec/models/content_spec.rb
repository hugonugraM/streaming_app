require 'rails_helper'

RSpec.describe Content, type: :model do
  it "is valid with valid attributes"
  it "is not valid without a title"
  it "is not valid without a plot"
  it "is not valid without a type"
  it "is valid without a season"
end
