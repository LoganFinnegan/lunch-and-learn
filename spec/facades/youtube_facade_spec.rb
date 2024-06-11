require 'rails_helper'

RSpec.describe YoutubeFacade do
  VCR.use_cassette('returns_youtube_videos_by_searched_country.yml') do
    xit 'returns youtube videos by searched country', :vcr do
      params = { part: "snippet", channelId: "UCluQ5yInbeAkkeCndNnUhpw", q: "India" }

      result = YoutubeFacade.search_youtube(params)	
      r      = result.first
      expect(result).to be_an(Array)
      expect(r).to be_a(Youtube)

      expect(r.id).to be_nil
      expect(r.title).to be_a(String)
      expect(r.youtube_video_id).to be_a(String)
    end
  end
end