require 'rails_helper'

RSpec.describe LearningResource do
  it 'exists and has attributes' do
    video   = 'x'
    images  = 'y'
    country = 'z'

    x = LearningResource.new(video, images, country)
    
    expect(x).to be_an(LearningResource)
    expect(x.id).to be_nil
    expect(x.country).to be_a(String)
    expect(x.video).to be_a(String)
    expect(x.images).to be_a(String)
  end
end