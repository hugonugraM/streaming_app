require "rails_helper"

RSpec.describe ContentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/contents").to route_to("contents#index")
    end
    it "routes to #movies" do
      expect(get: "/contents/movies").to route_to("contents#movies")
    end
    it "routes to #seasons" do
      expect(get: "/contents/seasons").to route_to("contents#seasons")
    end
  end
end
