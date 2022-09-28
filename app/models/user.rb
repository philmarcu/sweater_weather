class User < ApplicationRecord
  before_create :set_api_key
  validates :email, presence: true, uniqueness: true,  format: { with: URI::MailTo::EMAIL_REGEXP }
  has_secure_password
  

  def set_api_key
    self.api_key = ApiKey.create.access_token
  end
end
