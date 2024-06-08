require 'rails_helper'

RSpec.describe CountryFacade do
  VCR.use_cassette('returns_country_data.yml') do
    it 'returns country data', :vcr do
      result = CountryFacade.get_country
      
      expect(result).to be_an(String)
    end
  end
end