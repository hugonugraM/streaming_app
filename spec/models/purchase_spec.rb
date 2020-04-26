require 'rails_helper'

RSpec.describe Purchase, content_type: :model do
  context 'validation tests' do
    user = User.create(email: 'user@streaming.com')
    content = Content.create(title: 'the test title', plot: 'www.plot/url/location', number: 1, content_type:'s')
    purchase_option = PurchaseOption.create(quality: 'hd', price: 10.00, content: content)
    it 'ensures user presence' do
      purchase = Purchase.new(purchase_option: purchase_option).save
      expect(purchase).to eq(false)
    end

    it 'ensures purchase_option presence' do
      purchase = Purchase.new(user: user).save
      expect(purchase).to eq(false)
    end

    it 'saves succesfully' do
      purchase = Purchase.new(user: user, purchase_option: purchase_option).save
      expect(purchase).to eq(true)
    end
  end
end
