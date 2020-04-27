require "rails_helper"

RSpec.describe PurchasesController, type: :routing do
  before do
    @user = User.create(email: 'user@streaming.com')
  end
  describe "routing" do

    it "routes to #create" do
      expect(post: "/users/" + @user.id.to_s + "/purchases").to route_to("purchases#create", user_id: @user.id.to_s)
    end
  end
end
