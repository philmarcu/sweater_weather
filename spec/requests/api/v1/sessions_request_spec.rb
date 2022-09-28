require 'rails_helper'

RSpec.describe 'Log-in Request' do
  context 'happy path' do
    let(:parsed) { JSON.parse(response.body, symbolize_names: true) }
    let(:data) { parsed[:data] }
    let(:attributes) {  parsed[:data][:attributes] }

    it 'can send a log-in JSON object of an existing user' do
      user_params = {
        email: "yep@email.com",
        password: "password",
        password_confirmation: "password"
      }
      user = User.create(user_params)

      headers = {"CONTENT_TYPE" => "application/json"}
      post api_v1_sessions_path, headers: headers, params: JSON.generate(user_params)
      
      expect(response.body).to be_a String
      expect(parsed).to be_a Hash
      expect(parsed.to_json).to eq(response.body)
      expect(data.keys).to include(:id, :type, :attributes)
      expect(attributes.keys).to include(:email, :api_key)
    end
  end

  context 'sad path' do
    it 'does not log in user if passwords do not match' do
      user_params = {
        email: "yep@email.com",
        password: "password",
        password_confirmation: "1212221"
      }
      user = User.create(user_params)

      headers = {"CONTENT_TYPE" => "application/json"}
      post api_v1_sessions_path, headers: headers, params: JSON.generate(user_params)

      expect(response.status).to eq(400)
      expect(response.body).to eq("Invalid credentials, please try again")
    end

    it 'does not log in user if password is incorrect' do
      user_params = {
        email: "yep@email.com",
        password: "password",
        password_confirmation: "password"
      }
      bad_params = {
        email: "yep@email.com",
        password: "woops",
        password_confirmation: "woops",
      }
      user = User.create(user_params)

      headers = {"CONTENT_TYPE" => "application/json"}
      post api_v1_sessions_path, headers: headers, params: JSON.generate(bad_params)

      expect(response.status).to eq(400)
      expect(response.body).to eq("Invalid credentials, please try again")
    end

    it 'does not log in user if email(user) is not in system' do
      unsaved_params = {
        email: "yep@email.com",
        password: "password",
        password_confirmation: "password"
      }

      headers = {"CONTENT_TYPE" => "application/json"}
      post api_v1_sessions_path, headers: headers, params: JSON.generate(unsaved_params)

      expect(response.status).to eq(400)
      expect(response.body).to eq("Invalid credentials, please try again")
    end
  end
end