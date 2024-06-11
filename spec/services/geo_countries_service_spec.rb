require 'rails_helper'

RSpec.describe GeoCountriesService do
  VCR.use_cassette('returns_searched_country_data.yml') do
    it 'can make API call to database', :vcr do
      params = { text: 'country=canada' }
      query = GeoCountriesService.call_db('/v1/geocode/search', params)[:features]
      result = query.first
      
      expect(query).to be_an Array
      expect(result).to be_a Hash
      check_hash_structure(result[:properties], :lon, Float)
      check_hash_structure(result[:properties], :lat, Float)
    end
  end
end