require 'rails_helper'

RSpec.describe 'Request' do
  before(:each) do

  end

  describe 'happy paths' do
    # VCR.use_cassette('fixture name')
      it 'returns recipes for a country', :vcr do
        headers = { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json' }

        get api_v1_recipes_path, headers: headers, params: { country: 'England' }

        expect(response).to be_successful
        expect(response.status).to eq(200)

        market = JSON.parse(response.body, symbolize_names: true)[:data]

        check_hash_structure(market, :id, String)
        check_hash_structure(market, :attributes, Hash)
        check_hash_structure(market, :type, String)
        expect(market[:type]).to eq('market')

        attrs = market[:attributes]

        check_hash_structure(attrs, :name, String)
        check_hash_structure(attrs, :street, String)
        check_hash_structure(attrs, :city, String)
      end
  # end
  end
end