require 'rails_helper'

RSpec.describe CountryService, :vcr do
  VCR.use_cassette('can_make_API_call_to_country_database.yml') do
    it 'can make API call to country database', :vcr do
      query = CountryService.call_db('')
      result = query.first

      expect(query).to be_an Array
      expect(result).to be_a Hash
      check_hash_structure(result[:name], :common, String)
    end
  end
end

