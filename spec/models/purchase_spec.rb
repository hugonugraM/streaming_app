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

  context 'scope and unique tests' do
    user1 = User.create(email: 'user@streaming.com')
    content1 = Content.create(title: 'the test title 1', plot: 'www.plot/url/location1', number: 1, content_type:'s')
    purchase_option_1 = PurchaseOption.create(quality: 'hd', price: 10.00, content: content1)
    purchase_option_2 = PurchaseOption.create(quality: 'sd', price: 5.00, content: content1)
    content2 = Content.create(title: 'the test title 2', plot: 'www.plot/url/location2', number: 2, content_type:'s')
    purchase_option_3 = PurchaseOption.create(quality: 'hd', price: 10.00, content: content2)
    purchase1 = Purchase.create(user: user1, purchase_option: purchase_option_1)
    purchase2 = Purchase.create(user: user1, purchase_option: purchase_option_3)

    it 'should retrieve the 2 alive created purchases' do
      expect(Purchase.active.size).to eq(2)
    end

    it 'should retrieve the 1 active created purchases after updating the date of one' do
      purchase1.created_at -= 3.days
      purchase1.save
      expect(Purchase.active.size).to eq(1)
    end

    it 'should prevent the creation of two purchases of the same purchase option' do
      purchase3 = Purchase.new(user: user1, purchase_option: purchase_option_1).save
      expect(purchase3).to eq(false)
    end

    it 'should prevent the creation of two purchases of the same cont but different purchase_option' do
      purchase3 = Purchase.new(user: user1, purchase_option: purchase_option_2).save
      expect(purchase3).to eq(false)
    end

    it 'should let the creation of a new purchase of the same content after 3 days' do
      purchase1.created_at -= 3.days
      purchase1.save
      purchase3 = Purchase.new(user: user1, purchase_option: purchase_option_1).save
      expect(purchase3).to eq(true)
    end

  end
end
