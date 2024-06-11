require 'rails_helper'

RSpec.describe Api::V1::RecipesController, type: :controller do
  %w[index].each do |action|
    describe "GET ##{action}" do
      VCR.use_cassette('returns_a_successful_response.yml') do
        it 'returns a successful response', :vcr do
          get action.to_sym, params: { country: 'China' }
          
          expect(response).to be_successful
        end
      end
    end
  end
end