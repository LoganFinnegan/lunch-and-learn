require 'rails_helper'

RSpec.describe 'Request' do
  before(:each) do

  end

  describe 'happy paths' do
    VCR.use_cassette('returns_recipes_for_a_country.yml') do 
      it 'returns recipes for a country', :vcr do
        headers = { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json' }

        get api_v1_recipes_path, headers: headers, params: { country: 'India' }

        expect(response).to be_successful
        expect(response.status).to eq(200)

        recipes = JSON.parse(response.body, symbolize_names: true)[:data]

       expect(recipes.first[:id]).to be_nil

        attrs = recipes.first[:attributes]

        check_hash_structure(attrs, :url, String)
        check_hash_structure(attrs, :title, String)
        check_hash_structure(attrs, :image, String)
        check_hash_structure(attrs, :country, String)
      end
    end
  

    VCR.use_cassette('returns_random_country_recipes_when_none_is_given.yml') do
      it 'returns random country recipes when none is given', :vcr do 
        headers = { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json' }

        get api_v1_recipes_path, headers: headers
        # expect(response).to be_successful

        # expect(response.status).to eq(200)

        # recipes = JSON.parse(response.body, symbolize_names: true)[:data]

        # expect(recipes.first[:id]).to be_nil

        # attrs = recipes.first[:attributes]

        # check_hash_structure(attrs, :url, String)
        # check_hash_structure(attrs, :title, String)
        # check_hash_structure(attrs, :image, String)
        # check_hash_structure(attrs, :country, String)

        expect(response).to be_successful
        expect(response.status).to eq(200)
        recipes = JSON.parse(response.body, symbolize_names: true)

        expect(recipes[:data]).to eq([])
      end
    end
  end

  describe 'sad paths' do
    VCR.use_cassette('returns_nothing_if_you_enter_an_invalid_country.yml') do
      it 'returns nothing if you enter an invalid country', :vcr do
        headers = { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json' }

        get api_v1_recipes_path, headers: headers, params: { country: 'unicorn land' }

        expect(response).to be_successful
        expect(response.status).to eq(200)
        recipes = JSON.parse(response.body, symbolize_names: true)

        expect(recipes[:data]).to eq([])
      end
    end
  end
end