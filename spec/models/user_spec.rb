require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :email}
    it { should validate_presence_of :password}
  end

  describe 'relationships' do
    it {should have_many :favorites}
  end

  describe 'instance methods' do
    describe '#generate_api_key' do
      it 'generates a new api_key for all users' do
        user1 = User.create(name: "Odell", email: "bad_email34@ruffruff.com", password: "badpass2", password_confirmation: "badpass2")
        user2 = User.create(name: "Alice", email: "alice@example.com", password: "password", password_confirmation: "password")

        allow(SecureRandom).to receive(:hex).and_return("mocked_api_key")
        
        User.generate_api_key

        expect(user1.reload.api_pwd).to eq("mocked_api_key")
        expect(user2.reload.api_pwd).to eq("mocked_api_key")
      end
    end
  end
end

