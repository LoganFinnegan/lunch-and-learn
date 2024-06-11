require 'rails_helper'

RSpec.describe 'favorites request' do
  before(:each) do
    @user = User.create({
      name: "Odell",
      email: "bad_email34@ruffruff.com",
      password: "badpass2",
      password_confirmation: "badpass2",
      api_pwd: "jgn983hy48thw9begh98h4539h4"
    })
    # this is simulating a logged in user
    @user.authenticate(@user.password)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  describe 'happy paths' do
    it 'adds a recipe to favorites list' do

      json_body = {   api_key: "jgn983hy48thw9begh98h4539h4",
                      country: "thailand",
                      recipe_link: "https://www.tastingtable.com/.....",
                      recipe_title: "Crab Fried Rice (Khaao Pad Bpu)"
    }.to_json

      request_path(:post, api_v1_favorites_path, json_body)

      expect(response).to be_successful
      expect(response.status).to eq(201)

      message = JSON.parse(response.body, symbolize_names: true)[:success]
      
      expect(message).to eq("Favorite added successfully")
    end
  end

  describe 'sad path' do
    it 'returns an error message if the api key is invalid' do 
      json_body = {   api_key: "jgn983hy48thw9begh98h4539",
                      country: "thailand",
                      recipe_link: "https://www.tastingtable.com/.....",
                      recipe_title: "Crab Fried Rice (Khaao Pad Bpu)"
    }.to_json

      request_path(:post, api_v1_favorites_path, json_body)

      expect(response).to_not be_successful
      expect(response.status).to eq(401)

      error = JSON.parse(response.body, symbolize_names: true)[:error]
      
      expect(error).to eq("User does not have necessary permission")
    end
  end
end