require 'rails_helper'
RSpec.describe ApiUser do
  before(:each) do
    @attrs = {
      id:      '1',
      name:    'Odell',
      email:   'goodboy@ruffruff.com',
      api_pwd: 'jgn983hyjgn983hy48thw9begh98h4539h4'
    }
    @obj = ApiUser.new(@attrs)
  end
  
  it 'can format the data from the database' do
    expect(@obj).to be_a ApiUser
    rvs = ['1', 'Odell', 'goodboy@ruffruff.com', 'jgn983hyjgn983hy48thw9begh98h4539h4']
    
    expect_obj_attrs(@obj, [:id, :name, :email, :api_key], rvs, String)
  end
end
