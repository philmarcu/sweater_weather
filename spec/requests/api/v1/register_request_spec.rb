require 'rails_helper'

RSpec.describe 'Register Request' do
  context 'user registration happy path' do
    it 'can create a new user' do
      user_params = {
        email: "yep@email.com",
        password: "password",
        password_confirmation: "password"
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
      results = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(400)
      expect(results[:message]).to eq("Email has already been taken")
    end

    it 'does not create user if passwords do not match' do
      user_params = {
        email: "yep@email.com",
        password: "password",
        password_confirmation: "1212221",
      }

      headers = {"CONTENT_TYPE" => "application/json"}
      post "/api/v1/users", headers: headers, params: JSON.generate(user_params)
      results = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(400)
      expect(results[:message]).to eq("Password confirmation doesn't match Password")
    end

    it 'does not create user if email is not valid' do
      user_params = {
        email: "wumbo",
        password: "password",
        password_confirmation: "password",
      }

      headers = {"CONTENT_TYPE" => "application/json"}
      post "/api/v1/users", headers: headers, params: JSON.generate(user_params)

      expect(response.status).to eq(400)
      expect(response.body).to eq("Invalid email, please try again")
    end
  end
end