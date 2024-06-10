require 'rails_helper'

RSpec.describe GeoCountriesFacade do
  # VCR.use_cassette('cassette_name.yml') do
    it 'returns searched country data', :vcr do
      params = 'India'
      result = GeoCountriesFacade.find_country(params)		
      r      = result.first
require 'pry'; binding.pry
      # expect(result).to be_an(Array)
      # expect(r).to be_a(GeoCountry)
      # expect(r.attribute).to be_an(data_type)
      # expect(r.attribute).to be_a(data_type)
      # expect(r.attribute).to be_a(data_type)
    end
  # end
end