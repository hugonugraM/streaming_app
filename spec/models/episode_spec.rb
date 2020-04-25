require 'rails_helper'

RSpec.describe Episode, content_type: :model do
  context 'validation tests' do
    it 'ensures title presence' do
      content = Content.new(title: 'the test title', plot: 'www.plot/url/location', number: 1, content_type:'s').save
      episode = Episode.new(plot: 'www.plot/url/location', number: 1, season: content).save
      expect(episode).to eq(false)
    end

    it 'ensures plot presence' do
      content = Content.new(title: 'the test title', plot: 'www.plot/url/location', number: 1, content_type:'s').save
      episode = Episode.new(title: 'the episode test title', number: 1, season: content).save
      expect(episode).to eq(false)
    end

    it 'ensures number presence' do
      content = Content.new(title: 'the test title', plot: 'www.plot/url/location', number: 1, content_type:'s').save
      episode = Episode.new(title: 'the episode test title', plot: 'www.plot/url/location', season: content).save
      expect(episode).to eq(false)
    end

    it 'ensures season presence' do
      episode = Episode.new(title: 'the episode test title', plot: 'www.plot/url/location', number: 1).save
      expect(episode).to eq(false)
    end

    it 'saves succesfully' do
      content = Content.new(title: 'the test title', plot: 'www.plot/url/location', number: 1, content_type:'s').save
      episode = Episode.new(title: 'the episode test title', plot: 'www.plot/url/location', number: 1, season: content).save
      expect(episode).to eq(true)
    end
  end
end
