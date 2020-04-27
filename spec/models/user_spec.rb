require "rails_helper"

RSpec.describe User, content_type: :model do
  context "validation tests" do
    it "ensures mail presence" do
      user = User.new().save
      expect(user).to eq(false)
    end

    it "saves succesfully" do
      user = User.new(email: "user@streaming.com").save
      expect(user).to eq(true)
    end
  end
end
