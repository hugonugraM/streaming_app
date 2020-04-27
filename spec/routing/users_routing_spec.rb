require "rails_helper"

RSpec.describe UsersController, type: :routing do
  before do
    @user = User.create(email: "user@streaming.com")
  end
  describe "routing" do
    it "routes to #library" do
      url = "/users/" + @user.id.to_s + "/library"
      expect(get: url).to route_to("users#library", user_id: @user.id.to_s)
    end
  end
end
