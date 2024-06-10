require 'rails_helper'

RSpec.describe GeoCountriesService do
  it 'can make API call to database', :vcr do
    params = { text: 'country=canada' }
    query = GeoCountriesService.call_db('/v1/geocode/search', params)[:features]
    result = query.first
    
    # require 'pry'; binding.pry
    expect(query).to be_an Array
    expect(result).to be_a Hash
    # check_hash_structure(result, :key_name, data_type)
  end
end