require "rails_helper"

RSpec.describe PurchaseOption, content_type: :model do
  context "validation tests" do
    before do
      @content = Content.create(title: "the content test title", plot: "www.plot/url/location", number: 2, content_type:'s')
    end
    it "ensures quality presence" do
      purchase_option = PurchaseOption.create(price: 10.00, content: @content).save
      expect(purchase_option).to eq(false)
    end

    it "ensures price presence" do
      purchase_option = PurchaseOption.new(quality: "hd", content: @content).save
      expect(purchase_option).to eq(false)
    end

    it "ensures content presence" do
      purchase_option = PurchaseOption.new(quality: "hd", price: 10.00).save
      expect(purchase_option).to eq(false)
    end

    it "saves succesfully" do
      purchase_option = PurchaseOption.new(quality: "hd", price: 10.00, content: @content).save
      expect(purchase_option).to eq(true)
    end
  end
end
