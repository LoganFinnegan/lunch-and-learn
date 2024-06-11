require 'rails_helper'

RSpec.describe GeoapifyFacade do
  VCR.use_cassette('it_returns_tourist_sites_from_searched_location.yml') do
    it 'it returns tourist sites from searched location', :vcr do
      location = GeoCountry.new({ properties: { lon: '46.2276', lat: '2.2137'} })
      
      result = GeoapifyFacade.search_for(location)
      r      = result.first

      expect(result).to be_an(Array)
      expect(r).to be_a(Geoapify)
      expect(r.id).to be_nil
      expect(r.name).to be_a(String)
      expect(r.address).to be_a(String)
      expect(r.place_id).to be_a(String)
    end
  end
end