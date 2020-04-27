require "rails_helper"

RSpec.describe UsersController, type: :routing do
  describe "routing" do
    it "routes to #library" do
      expect(get: "/users/1/library").to route_to("users#library", id: "1")
    end
  end
end
