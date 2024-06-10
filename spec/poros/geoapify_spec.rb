require 'rails_helper'

RSpec.describe Geoapify do
  it 'exists and has attributes' do
    data = { name: 'x', formatted: 'y', place_id: 'z' }

    x = Geoapify.new(data)
    
    expect(x).to be_an(Geoapify)
    expect(x.id).to be_nil
    expect(x.name).to be_a(String)
    expect(x.address).to be_a(String)
    expect(x.place_id).to be_a(String)
  end
end