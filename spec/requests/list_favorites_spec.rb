require 'rails_helper'

RSpec.describe 'list favorites' do
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

    @favorite = @user.favorites.create({
      country: "Thailand",
      recipe_link: "https://www.tastingtable.com/...",
      recipe_title: "Crab Fried Rice (Khaao Pad Bpu)"
    })
  end

  describe 'happy paths' do
    it 'returns a list of favorite recipes' do
      json_body = { api_key: "jgn983hy48thw9begh98h4539h4" }
      # get api_v1_favorites_path, headers: headers
      request_path(:get, api_v1_favorites_path, json_body)

      expect(response).to be_successful
      expect(response.status).to eq(200)

      favs = JSON.parse(response.body, symbolize_names: true)[:data].first

      expect_attrs(favs, [:id, :type], String)
      expect(favs[:type]).to eq('favorite')

      attrs = favs[:attributes]

      expect_attrs(attrs, [:recipe_title, :recipe_link, :country], String)
    end
  end

  describe 'sad path' do
    it 'returns an error message if the api key for fav is invalid' do 
      json_body = { api_key: "jgn983hy48thw9begh98h45" }

      request_path(:get, api_v1_favorites_path, json_body)

      expect(response).to_not be_successful
      expect(response.status).to eq(401)

      favs = JSON.parse(response.body, symbolize_names: true)[:error]

      expect(favs).to eq("Invalid API key")
    end
  end
end