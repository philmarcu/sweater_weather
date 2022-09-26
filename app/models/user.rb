class User < ApplicationRecord
  before_create :set_api_key
  validates :email, presence: true, uniqueness: true
  has_secure_password
  

  def set_api_key
    self.api_key = generate_api_key
  end

  def generate_api_key
    SecureRandom.hex(10)
  end
end
