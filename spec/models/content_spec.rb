require 'rails_helper'

RSpec.describe Content, content_type: :model do
  context 'validation tests' do
    it 'ensures title presence' do
      content = Content.new(plot: 'www.plot/url/location', content_type:'m').save
      expect(content).to eq(false)
    end

    it 'ensures plot presence' do
      content = Content.new(title: 'the test title', content_type:'m').save
      expect(content).to eq(false)
    end

    it 'ensures content_type presence' do
      content = Content.new(title: 'the test title', plot: 'www.plot/url/location').save
      expect(content).to eq(false)
    end

    it 'ensures number presence for seasons' do
      content = Content.new(title: 'the test title', plot: 'www.plot/url/location', content_type:'s').save
      expect(content).to eq(false)
    end

    it 'saves movie succesfully' do
      content = Content.new(title: 'the test title', plot: 'www.plot/url/location', content_type:'m').save
      expect(content).to eq(true)
    end

    it 'saves season succesfully' do
      content = Content.new(title: 'the test title', plot: 'www.plot/url/location', number: 1, content_type:'s').save
      expect(content).to eq(true)
    end
  end
end
