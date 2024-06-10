require 'rails_helper'

RSpec.describe GeoapifyFacade do
  # VCR.use_cassette('cassette_name.yml') do
    it 'it returns x from searched location', :vcr do
      poi = 'subway'
      location = { lat: '103.8535738', lon: '1.3051442' }
      
      result = GeoapifyFacade.search_for(poi, location)
      r      = result.first
require 'pry'; binding.pry
      expect(result).to be_an(Array)
      expect(r).to be_a(Geoapify)
      expect(r.attribute).to be_an(data_type)
      expect(r.attribute).to be_a(data_type)
      expect(r.attribute).to be_a(data_type)
    end
  # end
end