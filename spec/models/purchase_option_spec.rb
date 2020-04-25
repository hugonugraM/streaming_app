require 'rails_helper'

RSpec.describe PurchaseOption, content_type: :model do
  context 'validation tests' do
    it 'ensures quality presence' do
      content = Content.new(title: 'the test title', plot: 'www.plot/url/location', number: 1, content_type:'s').save
      purchase_option = PurchaseOption.new(price: 10.00, content: content).save
      expect(purchase_option).to eq(false)
    end

    it 'ensures price presence' do
      content = Content.new(title: 'the test title', plot: 'www.plot/url/location', number: 1, content_type:'s').save
      purchase_option = PurchaseOption.new(quality: 'hd', content: content).save
      expect(purchase_option).to eq(false)
    end

    it 'ensures content presence' do
      content = Content.new(title: 'the test title', plot: 'www.plot/url/location', number: 1, content_type:'s').save
      purchase_option = PurchaseOption.new(quality: 'hd', price: 10.00).save
      expect(purchase_option).to eq(false)
    end

    it 'saves succesfully' do
      content = Content.new(title: 'the test title', plot: 'www.plot/url/location', number: 1, content_type:'s').save
      purchase_option = PurchaseOption.new(quality: 'hd', price: 10.00, content: content).save
      expect(purchase_option).to eq(true)
    end
  end
end
