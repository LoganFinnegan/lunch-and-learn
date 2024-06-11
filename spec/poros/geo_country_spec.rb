require 'rails_helper'

RSpec.describe GeoCountry do
  it 'exists and has attributes' do
    data = { properties: { lon: 'x', lat: 'y'} }

    x = GeoCountry.new(data)
    
    expect(x).to be_an(GeoCountry)
    expect(x.lon).to be_a(String)
    expect(x.lat).to be_a(String)
  end
end