require 'rails_helper'

RSpec.describe GeoapifyService, :vcr do
  VCR.use_cassette('can_make_API_call_to_geoapify.yml') do
    it 'can make API call to geoapify', :vcr do
      params = { categories: 'public_transport.subway',
                bias: 'proximity:-0.07071648508463113,51.50848194136378',
                limit: 1
                }
      query = GeoapifyService.call_db('/v2/places', params)[:features]
      result = query.first

      expect(query).to be_an Array
      expect(result).to be_a Hash
      check_hash_structure(result[:properties], :name, String)
      check_hash_structure(result[:properties], :formatted, String)
      check_hash_structure(result[:properties], :place_id, String)
    end
  end
end
