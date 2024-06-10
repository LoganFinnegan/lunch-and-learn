require 'rails_helper'

RSpec.describe 'Places' do
  describe 'happy paths' do
    VCR.use_cassette('resturns_10_places_from_the_searched_country.yml') do 
      it 'resturns 10 places from the searched country', :vcr do
        headers = { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json' }
        
        params = { country: "France" }

        get api_v1_tourist_sites_path, headers: headers, params: params
        
        expect(response).to be_successful
        expect(response.status).to eq(200)
        
        places = JSON.parse(response.body, symbolize_names: true)[:data].first

        expect(places[:id]).to be_nil
        check_hash_structure(places, :attributes, Hash)
        expect(places[:type]).to eq('tourist_site')
        
        attrs = places[:attributes]
        
        check_hash_structure(attrs, :name, String)
        check_hash_structure(attrs, :address, String)
        check_hash_structure(attrs, :place_id, String)
      end
    end
  end
end