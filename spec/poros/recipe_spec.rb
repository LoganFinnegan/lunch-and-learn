require 'rails_helper'

RSpec.describe Recipe do
  it 'exists and has attributes' do
    data = { label: "x", url: "y", country: "z", image: "a"
    }

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