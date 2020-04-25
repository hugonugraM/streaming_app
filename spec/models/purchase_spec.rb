require 'rails_helper'

RSpec.describe Purchase, content_type: :model do
  context 'validation tests' do
    user = User.new(email: 'user@streaming.com').save
    content = Content.new(title: 'the test title', plot: 'www.plot/url/location', number: 1, content_type:'s').save
    it 'ensures user presence' do
      purchase = PurchaseOption.new(content: content).save
      expect(purchase).to eq(false)
    end

    it 'ensures content presence' do
      purchase = PurchaseOption.new(user: user).save
      expect(purchase).to eq(false)
    end

    it 'saves succesfully' do
      purchase = PurchaseOption.new(user: user, content: content).save
      expect(purchase).to eq(true)
    end
  end
end
