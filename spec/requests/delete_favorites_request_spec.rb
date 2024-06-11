require 'rails_helper'

RSpec.describe 'delete favorites' do
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
    # require 'pry'; binding.pry
  end

  describe 'happy paths' do
    it 'deletes a recipe from favorites' do
     
      request_path(:delete, api_v1_favorite_path(@favorite))

      expect(response).to be_successful
      expect(response.status).to eq(204)

      expect(@user.favorites).to eq([])
    end
  end

  describe 'sad path' do
    it 'returns an error message if item not found/delted' do 

      request_path(:delete, api_v1_favorites_path('10'))

      expect(response).to_not be_successful
      expect(response.status).to eq(404)

      error = JSON.parse(response.body, symbolize_names: true)[:error]

      expect(error).to eq("Not Found")
    end
  end
end