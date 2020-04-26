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

    it 'ensures uniqueness of number for seasons' do
      content1 = Content.new(title: 'the test title', plot: 'www.plot/url/location', number: 1, content_type:'s').save
      content2 = Content.new(title: 'the test title', plot: 'www.plot/url/location', number: 1, content_type:'s').save
      expect(content2).to eq(false)
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

  context 'scope tests' do
    before (:each) do
      movie1 = Content.create(title: 'the test title 1', plot: 'www.plot/url/location1', content_type:'m')
      movie2 = Content.create(title: 'the test title 1', plot: 'www.plot/url/location1', content_type:'m')
      season1 = Content.create(title: 'the test title 1', plot: 'www.plot/url/location1', number: 1, content_type:'s')
      season2 = Content.create(title: 'the test title 1', plot: 'www.plot/url/location1', number: 2, content_type:'s')
      season3 = Content.create(title: 'the test title 1', plot: 'www.plot/url/location1', number: 3, content_type:'s')
    end

    it 'should retrieve the 2 movies' do
      expect(Content.movies.size).to eq(2)
    end

    it 'should retrieve the 3 seasons' do
      expect(Content.seasons.size).to eq(3)
    end
  end
end
