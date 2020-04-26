require 'rails_helper'

RSpec.describe Episode, content_type: :model do
  context 'validation tests' do
    content = Content.create(title: 'the test title', plot: 'www.plot/url/location', number: 1, content_type:'s')
    it 'ensures title presence' do
      episode = Episode.new(plot: 'www.plot/url/location', number: 1, season: content).save
      expect(episode).to eq(false)
    end

    it 'ensures plot presence' do
      episode = Episode.new(title: 'the episode test title', number: 1, season: content).save
      expect(episode).to eq(false)
    end

    it 'ensures number presence' do
      episode = Episode.new(title: 'the episode test title', plot: 'www.plot/url/location', season: content).save
      expect(episode).to eq(false)
    end

    it 'ensures uniqueness of number of episode for seasons' do
      episode1 = Episode.new(title: 'the episode test title 1', plot: 'www.plot/url/location', number: 1, season: content).save
      episode2 = Episode.new(title: 'the episode test title 2', plot: 'www.plot/url/location', number: 1, season: content).save
      expect(episode2).to eq(false)
    end

    it 'ensures uniqueness of title of episode for seasons' do
      episode1 = Episode.new(title: 'the episode test title same', plot: 'www.plot/url/location', number: 1, season: content).save
      episode2 = Episode.new(title: 'the episode test title same', plot: 'www.plot/url/location', number: 2, season: content).save
      expect(episode2).to eq(false)
    end

    it 'ensures number presence' do
      episode = Episode.new(title: 'the episode test title', plot: 'www.plot/url/location', season: content).save
      expect(episode).to eq(false)
    end

    it 'saves succesfully' do
      episode = Episode.new(title: 'the episode test title', plot: 'www.plot/url/location', number: 1, season: content).save
      expect(episode).to eq(true)
    end
  end
end
