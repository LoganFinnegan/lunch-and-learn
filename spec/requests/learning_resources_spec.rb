require 'rails_helper'

RSpec.describe 'learning resources' do
  before(:each) do

  end

  describe 'happy paths' do
    VCR.use_cassette('returns_youtube_vids_for_the_country.yml') do 
      it 'returns youtube vids for the country', :vcr do
        headers = { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json' }

        p = { country: "India" }

        get api_v1_learning_resources_path, headers: headers, params: p
        
        expect(response).to be_successful
        expect(response.status).to eq(200)
        
        resources = JSON.parse(response.body, symbolize_names: true)[:data]

        expect(resources[:id]).to be_nil
        check_hash_structure(resources, :attributes, Hash)
        check_hash_structure(resources[:attributes], :images, Array)
        expect(resources[:type]).to eq('learning_resource')

        attrs = resources[:attributes]

        check_hash_structure(attrs, :video, Hash)
        check_hash_structure(attrs, :images, Array)
        check_hash_structure(attrs, :country, String)
      end
    end
  end

  describe 'sad path' do 
    VCR.use_cassette('returns_blank_data_for_invalid_searches.yml') do
      it 'returns blank data for invalid searches', :vcr do
        headers = { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json' }

        p = { country: "pimpland" }

        get api_v1_learning_resources_path, headers: headers, params: p
        
        expect(response).to be_successful
        expect(response.status).to eq(200)
        
        resources = JSON.parse(response.body, symbolize_names: true)[:data]

        expect(resources[:id]).to be_nil
        check_hash_structure(resources, :attributes, Hash)
        check_hash_structure(resources[:attributes], :images, Array)
        expect(resources[:type]).to eq('learning_resource')

        attrs = resources[:attributes]

        check_hash_structure(attrs, :video, Hash)
        check_hash_structure(attrs, :images, Array)
        check_hash_structure(attrs, :country, String)

        expect(attrs[:video]).to eq({})
        expect(attrs[:images]).to eq([])
        expect(attrs[:country]).to eq('pimpland')
      end
    end
  end
end

