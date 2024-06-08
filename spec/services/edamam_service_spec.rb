require 'rails_helper'

RSpec.describe EdamamService do
  VCR.use_cassette('can_make_API_call_to_recipe_database.yml') do
    it 'can make API call to recipe database', :vcr do
      params = { q: 'India', type: "any" }
      query = EdamamService.call_db('/api/recipes/v2', params)[:hits]
      result = query.first

      expect(query).to be_an Array
      expect(result).to be_a Hash
      check_hash_structure(result, :recipe, Hash)
    end
  end
end