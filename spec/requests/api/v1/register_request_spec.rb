require 'rails_helper'

RSpec.describe 'Register Request' do
  context 'user registration happy path' do
    it 'can create a new user' do

      user_params = {
        email: "yep@email.com",
        password: "password",
        password_confirmation: "password",
        api_key: SecureRandom.hex(10)
      }

      headers = {"CONTENT_TYPE" => "application/json"}
      post "/api/v1/users", headers: headers, params: JSON.generate(user_params)
      results = JSON.parse(response.body, symbolize_names: true)
      type = results[:data][:type]
      attributes = results[:data][:attributes]

      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(response.body).to be_a String
      expect(results).to be_a Hash
      expect(results[:data]).to have_key(:id)
      expect(results[:data]).to have_key(:type)
      expect(type).to eq("users")
      expect(results[:data]).to have_key(:attributes)
      expect(attributes).to have_key(:email)
      expect(attributes).to have_key(:api_key)
      expect(attributes[:email]).to eq(user_params[:email])
    end
  end
end