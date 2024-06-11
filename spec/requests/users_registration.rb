require 'rails_helper'

RSpec.describe 'user registration' do
  before(:each) do

  end

  describe 'happy paths' do
    # VCR.use_cassette('fixture name') p
      it 'it registers a user', :vcr do
        headers = { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json' }

        body = {
          "name": "Odell",
          "email": "goodboy@ruffruff.com",
          "password": "treats4lyf",
          "password_confirmation": "treats4lyf"
        }

        get new_api_v1_user_path, headers: headers, params: body
require 'pry'; binding.pry
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