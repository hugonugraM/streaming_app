require "rails_helper"

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we"re
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/users", type: :request do
  before do
    @user1 = User.create(email: "user@streaming.com")
    @content1 = Content.create(title: "the purchase test title 1", plot: "www.plot/url/location1", number: 1, content_type:'s')
    @purchase_option_1 = PurchaseOption.create(quality: "hd", price: 10.00, content: @content1)
    @purchase_option_2 = PurchaseOption.create(quality: "sd", price: 5.00, content: @content1)
    @content2 = Content.create(title: "the purchase test title 2", plot: "www.plot/url/location2", number: 2, content_type:'s')
    @purchase_option_3 = PurchaseOption.create(quality: "hd", price: 10.00, content: @content2)
    @purchase1 = Purchase.create(user: @user1, purchase_option: @purchase_option_1)
    @purchase2 = Purchase.create(user: @user1, purchase_option: @purchase_option_3)
  end

  before do
    get "/users/" + @user1.id.to_s + "/library", as: :json
  end

  describe "GET /library" do
    it "renders a successful response" do
      expect(response).to be_successful
    end

    it "lists the user´s content" do
      list_of_ids = JSON.parse(response.body).map{ |content| content["content"]["id"] }
      expect( list_of_ids ).to eq( [@content1.id, @content2.id] )
    end

    it "shows user´s content remaining time" do
      list_of_ids = JSON.parse(response.body).map{ |content| content["content"]["id"] }
      expect( JSON.parse(response.body).first["remaining_time"].nil? ).to eq( false )
    end
  end
end
