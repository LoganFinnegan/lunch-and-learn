require 'rails_helper'

RSpec.describe Recipe do
  xit 'exists and has attributes' do
    data = { id: '1', name: '2', email: '3',  }

    country = "india"
    x = Recipe.new(data, country)
    
    expect(x).to be_an(Recipe)
    expect(x.id).to be_nil
    expect(x.url).to be_a(String)
    expect(x.image).to be_a(String)
    expect(x.title).to be_a(String)
    expect(x.country).to be_a(String)
  end
end