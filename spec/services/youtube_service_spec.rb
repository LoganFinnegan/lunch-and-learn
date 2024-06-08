require 'rails_helper'

RSpec.describe YoutubeService do
  VCR.use_cassette('can_make_API_call_to_youtube_database.yml') do
    it 'can make API call to youtube database', :vcr do
      params = { part: "snippet", channelId: "UCluQ5yInbeAkkeCndNnUhpw", q: "India" }
      query = YoutubeService.call_db('/youtube/v3/search', params)[:items]
      result = query.first
      
      expect(query).to be_an Array
      expect(result).to be_a Hash
      check_hash_structure(result, :snippet, Hash)
    end
  end
end