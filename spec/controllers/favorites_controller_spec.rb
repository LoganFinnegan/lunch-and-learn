require 'rails_helper'

RSpec.describe Api::V1::FavoritesController, type: :controller do
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
    @user.authenticate(@user.password)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  %w[index create destroy].each do |action|
    describe "GET ##{action}" do
      it 'returns a successful response', :vcr do
        if action == 'destroy' 
          favorite = @user.favorites.create({
          country: "Thailand",
          recipe_link: "https://www.tastingtable.com/...",
          recipe_title: "Crab Fried Rice (Khaao Pad Bpu)"
          })
          get action.to_sym, params: { id: "#{favorite.id}" }
        else 
          get action.to_sym, params: { api_key: "jgn983hy48thw9begh98h4539h4", id: '1', country: "China", recipe_title: "tacos", recipe_link: "yasss"}
        end
        expect(response).to be_successful
      end
    end
  end
end