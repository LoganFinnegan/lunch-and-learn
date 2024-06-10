require 'rails_helper'

VCR.use_cassette('can_make_an_api_call_to_unsplash.yml') do 
  RSpec.describe UnsplashService, :vcr do
    it 'can make an api call to unsplash', :vcr do
      params = { query: "India"}
      query = UnsplashService.call_db('/search/photos', params)[:results]
      result = query.first
  
      expect(query).to be_an Array
      expect(result).to be_a Hash
      check_hash_structure(result, :slug, String)
      check_hash_structure(result[:alternative_slugs], :en, String)
    end
  end
end