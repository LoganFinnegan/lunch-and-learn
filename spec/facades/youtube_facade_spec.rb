require 'rails_helper'

RSpec.describe YoutubeFacade do
  VCR.use_cassette('returns_youtube_videos_by_searched_country.yml') do
    it 'returns youtube videos by searched country', :vcr do
      params = { part: "snippet", channelId: "UCluQ5yInbeAkkeCndNnUhpw", q: "India" }

      result = YoutubeFacade.search_youtube(params)	

      expect(result).to be_an(Hash)

      expect_hash_attrs(result, [:title, :youtube_video_id], String)
    end
  end
end