class User < ApplicationRecord
  has_secure_password
  has_many :favorites, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true

  def self.generate_api_key
    update(api_pwd: SecureRandom.hex(15))
  end
end
