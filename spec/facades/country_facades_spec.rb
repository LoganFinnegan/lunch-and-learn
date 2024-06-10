require 'rails_helper'

RSpec.describe CountryFacade do
  VCR.use_cassette('returns_country_data.yml') do
    it 'returns country data', :vcr do
      result = CountryFacade.get_country

      expect(result.name).to be_an(String)
      expect(result.lat).to be_an(Float)
      expect(result.lon).to be_an(Float)
    end
  end
end