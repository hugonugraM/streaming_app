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

    it 'ensures season presence' do
      episode = Episode.create(title: 'the episode test title', plot: 'www.plot/url/location', number: 1).save
      expect(episode).to eq(false)
    end

    it 'saves succesfully' do
      episode = Episode.new(title: 'the episode test title', plot: 'www.plot/url/location', number: 1, number: 1, season: content).save
      expect(episode).to eq(true)
    end
  end
end
