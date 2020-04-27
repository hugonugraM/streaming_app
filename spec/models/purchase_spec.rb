require "rails_helper"

RSpec.describe Purchase, content_type: :model do
  context "validation tests" do
    before do
      @user = User.create(email: "user@streaming.com")
      @content = Content.create(title: "the content test title", plot: "www.plot/url/location", number: 1, content_type:'s')
      @purchase_option = PurchaseOption.create(quality: "hd", price: 10.00, content: @content)
    end
    it "ensures user presence" do
      purchase = Purchase.new(purchase_option: @purchase_option).save
      expect(purchase).to eq(false)
    end

    it "ensures purchase_option presence" do
      purchase = Purchase.new(user: @user).save
      expect(purchase).to eq(false)
    end

    it "saves succesfully" do
      purchase = Purchase.new(user: @user, purchase_option: @purchase_option).save
      expect(purchase).to eq(true)
    end
  end

  context "scope and unique tests" do
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

    it "should retrieve the 2 alive created purchases" do
      expect(Purchase.active.size).to eq(2)
    end

    it "should prevent the creation of two purchases of the same purchase option" do
      purchase3 = Purchase.new(user: @user1, purchase_option: @purchase_option_1).save
      expect(purchase3).to eq(false)
    end

    it "should prevent the creation of two purchases of the same cont but different purchase_option" do
      purchase3 = Purchase.new(user: @user1, purchase_option: @purchase_option_2).save
      expect(purchase3).to eq(false)
    end

  end
end
