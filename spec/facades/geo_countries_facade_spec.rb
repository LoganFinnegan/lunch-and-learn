require 'rails_helper'

RSpec.describe GeoCountriesFacade do
  VCR.use_cassette('returns_searched_country_data.yml') do
    it 'returns searched country data', :vcr do
      params = 'India'
      result = GeoCountriesFacade.find_country(params)		
      r      = result.first

      expect(result).to be_an(Array)
      expect(r).to be_a(GeoCountry)
      expect(r.lat).to be_an(Float)
      expect(r.lon).to be_an(Float)
    end
  end
end