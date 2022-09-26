require 'rails_helper'

RSpec.describe 'Register Request' do
  context 'user registration happy path' do
    it 'can create a new user' do
      user_params = {
        email: "yep@email.com",
        password: "password",
        password_confirmation: "password",
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
      expect(results[:data].size).to eq(3)
      expect(results[:data]).to have_key(:id)
      expect(results[:data]).to have_key(:type)
      expect(results[:data]).to have_key(:attributes)
      expect(type).to eq("users")

      expect(attributes).to have_key(:email)
      expect(attributes).to have_key(:api_key)
      expect(attributes[:email]).to eq(user_params[:email])
    end
  end

  context 'user registration sad path' do
    it 'does not create already existing user' do
      user_params = {
        email: "yep@email.com",
        password: "password",
        password_confirmation: "password",
      }
      user = User.create(user_params)

      headers = {"CONTENT_TYPE" => "application/json"}
      post "/api/v1/users", headers: headers, params: JSON.generate(user_params)      

      expect(response.status).to eq(400)
      expect(response.body).to eq("A user already exists with this email")
    end

    it 'does not create user if passwords do not match' do
      user_params = {
        email: "yep@email.com",
        password: "password",
        password_confirmation: "pwd",
      }

      headers = {"CONTENT_TYPE" => "application/json"}
      post "/api/v1/users", headers: headers, params: JSON.generate(user_params)

      expect(response.status).to eq(400)
      expect(response.body).to eq("Passwords must match")
    end
  end
end