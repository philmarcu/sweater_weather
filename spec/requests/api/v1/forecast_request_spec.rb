require 'rails_helper'

RSpec.describe 'Forecast Request', :vcr do
  let(:location) { "Denver,CO" }

  context '#forecast_serializer' do
    it 'sends response with current + daily + hourly weather' do

      get "/api/v1/forecast?location=#{location}"

      parsed = JSON.parse(response.body, symbolize_names: true)
      current = parsed[:data][:attributes][:current]
      daily = parsed[:data][:attributes][:daily]
      hourly = parsed[:data][:attributes][:hourly]

      expect(response).to be_successful
      expect(parsed).to be_a Hash
      expect(current).to be_a Hash
      expect(daily).to be_a Array
      expect(hourly).to be_a Array
      expect(current.keys.size).to eq(10)
      expect(daily.size).to eq(5)
      expect(hourly.size).to eq(8)
      expect(current.keys.first).to eq(:datetime)
      expect(current.keys.last).to eq(:icon)
      
      daily.each do |day|
        expect(day.keys.size).to eq(7)
        expect(day.keys.first).to eq(:date)
        expect(day.keys.last).to eq(:icon)
      end

      hourly.each do |hour|
        expect(hour.keys.size).to eq(4)
        expect(hour.keys.first).to eq(:time)
        expect(hour.keys.last).to eq(:icon)
      end
    end
  end
end