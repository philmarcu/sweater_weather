require 'rails_helper'

RSpec.describe 'Roadtrip Request', :vcr do
  
  context 'happy path' do
    let(:origin) { "Denver, CO" }
    let(:destination) { "Estes Park, CO" }
    let(:parsed) { JSON.parse(response.body, symbolize_names: true) }
    let(:type) { parsed[:data][:type] }
    let(:attributes) { parsed[:data][:attributes] }

    before do
      @user_params = {
        email: "yep@email.com",
        password: "password",
        password_confirmation: "password"
      }
      @user = User.create(@user_params)
    end

    it 'returns a JSON object of a users roadtrip info' do
      post_params = {
        origin: origin,
        destination: destination,
        api_key: @user.api_key
      }
      
      headers = {"CONTENT_TYPE" => "application/json"}
      post api_v1_road_trip_path, headers: headers, params: JSON.generate(post_params)

      expect(response).to be_successful
      expect(parsed).to be_a Hash
      expect(type).to eq "roadtrip"
      expect(attributes).to include(:start_city, :end_city, :travel_time, :weather_at_eta)
    end
  end

  context 'sad path' do
    it 'returns error if no api key exists' do
      post_params = {
        origin: "Denver, CO",
        destination: "Estes Park, CO",
        api_key: nil
      }

      headers = {"CONTENT_TYPE" => "application/json"}
      post api_v1_road_trip_path, headers: headers, params: JSON.generate(post_params)

      expect(response.status).to eq(401)
      expect(response.body).to eq("Invalid access, user must be logged in")
    end

    it 'returns error if api key is not in d/b' do
      post_params = {
        origin: "Denver, CO",
        destination: "Estes Park, CO",
        api_key: "0w0w0w0wnumbers"
      }

      headers = {"CONTENT_TYPE" => "application/json"}
      post api_v1_road_trip_path, headers: headers, params: JSON.generate(post_params)

      expect(response.status).to eq(401)
      expect(response.body).to eq("Invalid access, user must be logged in")
    end

    it 'returns impossible route if start & finish too improbable' do
      user_params = {
        email: "yep@email.com",
        password: "password",
        password_confirmation: "password"
      }
      user = User.create(user_params)

      post_params = {
        origin: "Denver, CO",
        destination: "London, UK",
        api_key: user.api_key
      }

      headers = {"CONTENT_TYPE" => "application/json"}
      post api_v1_road_trip_path, headers: headers, params: JSON.generate(post_params)
      parsed = JSON.parse(response.body, symbolize_names: true)
      error = parsed[:data][:attributes][:message]

      expect(response).to be_successful
      expect(error).to eq("We are unable to route with the given locations.")
    end
  end
end