require 'rails_helper'

RSpec.describe 'login request' do
  before(:each) do
    @headers = { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json' }
    @user = User.create({
      name: "Odell",
      email: "bad_email34@ruffruff.com",
      password: "badpass2",
      password_confirmation: "badpass2",
      api_pwd: SecureRandom.hex(15)
    })
    # @user.authenticate(@user.password)
    # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  describe 'happy paths' do
    it 'logs in an existing user' do

      json_body = { email: 'bad_email34@ruffruff.com', password: 'badpass2' }.to_json

      post api_v1_sessions_path, headers: @headers, params: json_body

      expect(response).to be_successful
      expect(response.status).to eq(200)
      
      result = JSON.parse(response.body, symbolize_names: true)[:data]

      check_hash_structure(result, :id, String)
      expect(result[:type]).to eq('user')

      attrs = result[:attributes]

      check_hash_structure(attrs, :name, String)
      check_hash_structure(attrs, :email, String)
      check_hash_structure(attrs, :api_key, String)
    end
  end

  describe 'sad path' do
    it 'returns an error message if the pass or username is incorrect' do 

      json_body = { email: 'bad_email34@ruffruff.com', password: 'pain' }.to_json

      post api_v1_sessions_path, headers: @headers, params: json_body

      expect(response).to_not be_successful
      expect(response.status).to eq(401)
      
      error = JSON.parse(response.body)['error']

      expect(error).to eq("Invalid email or password")
    end
  end
end