require 'rails_helper'

RSpec.describe GeoapifyService do
  it 'can make API call to geoapify', :vcr do
    params = { categories: 'public_transport.subway',
               bias: 'proximity:-0.07071648508463113,51.50848194136378',
               limit: 1
              }
    query = GeoapifyService.call_db('/v2/places', params)[:features]
    result = query.first

# require 'pry'; binding.pry
    expect(query).to be_an Array
    expect(result).to be_a Hash
    # check_hash_structure(result, :key_name, data_type)
  end
end