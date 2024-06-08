require 'rails_helper'

RSpec.describe EdamamFacade do
  VCR.use_cassette('returns_country_recipes.yml') do
    it 'returns country recipes', :vcr do
      result = EdamamFacade.search_recipes("Inda")
      r      = result.first
      
      expect(result).to be_an(Array)
      expect(r).to be_a(Recipe)

      expect(r.id).to be_nil
      expect(r.url).to be_an(String)
      expect(r.image).to be_an(String)
      expect(r.title).to be_an(String)
      expect(r.country).to be_an(String)
    end
  end
end