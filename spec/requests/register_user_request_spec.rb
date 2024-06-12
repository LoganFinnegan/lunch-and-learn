require 'rails_helper'

RSpec.describe 'Request' do
  describe 'happy paths' do
    it 'can register a new user', :vcr do

      json_body = {
        name: "Odell",
        email: "goodboy@ruffruff.com",
        password: "treats4lyf",
        password_confirmation: "treats4lyf"
      }.to_json
      
      request_path(:post, api_v1_users_path, json_body)

      expect(response).to be_successful
      expect(response.status).to eq(201)

      user = JSON.parse(response.body, symbolize_names: true)[:data]

      check_hash_structure(user, :attributes, Hash)
      expect_hash_attrs(user, [:id, :type], String)
      expect(user[:type]).to eq('user')

      attrs = user[:attributes]

      expect_hash_attrs(attrs, [:name, :email, :api_key], String)
    end
  end

  describe 'sad path' do
    it 'returns an error message if the pass or username is invalid', :vcr do 
      headers = { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json' }

      json_body = {
        name: "Odell",
        email: "goodboy@ruffruff.com",
        password: "bad_pass1",
        password_confirmation: "bad_pass2"
      }.to_json
      

      # post api_v1_users_path, headers: headers, params: json_body
      request_path(:post, api_v1_users_path, json_body)

      expect(response).to_not be_successful
      expect(response.status).to eq(422)
      
      errors = JSON.parse(response.body, symbolize_names: true)[:errors]

      expect(errors[0]).to be_a(String)
      expect(errors[0]).to eq("Password confirmation doesn't match Password")
    end
  end
end