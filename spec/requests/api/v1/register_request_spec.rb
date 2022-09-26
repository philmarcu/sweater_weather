require 'rails_helper'

RSpec.describe 'Register Request' do
  context 'user registration' do
    it 'can create a new user' do

      user_params = {
        email: "yep@email.com",
        password: "password",
        password_confirmation: "password"
        api_key: "92b15d6c8dc4beb5f559"
      }

      headers = {"CONTENT_TYPE" => "application/json"}
      post "/api/v1/users", headers: headers, params: JSON.generate(user_params)
      results = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(response.body).to be_a String
      expect(results).to be_a Hash
    end
  end
end