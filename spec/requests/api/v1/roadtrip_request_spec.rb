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
end