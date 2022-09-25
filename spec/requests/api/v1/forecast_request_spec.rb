require 'rails_helper'

RSpec.describe 'Forecast Request', :vcr do
  let(:location) { "Denver,CO" }

  context '#forecast_serializer' do
    let(:parsed) { JSON.parse(response.body, symbolize_names: true) }
    let(:current) { parsed[:data][:attributes][:current] }
    let(:daily) { parsed[:data][:attributes][:daily] }
    let(:hourly) { parsed[:data][:attributes][:hourly] }
    let(:day) { daily.first }
    let(:hour) { hourly.first }

    it 'sends response with current + daily + hourly weather' do
      get "/api/v1/forecast?location=#{location}"

      expect(response).to be_successful
      expect(parsed).to be_a Hash
      expect(current).to be_a Hash
      expect(daily).to be_a Array
      expect(hourly).to be_a Array
      expect(parsed.size).to eq(1)
      expect(current.keys.size).to eq(10)
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
    
    it 'is formatted with different fields compared to the real call' do
      get "/api/v1/forecast?location=#{location}"

      real_call = JSON.parse(File.read('spec/fixtures/full_forecast.json'), symbolize_names: true)
      real_current = real_call[:current]
      real_day = real_call[:daily].first
      real_hour = real_call[:hourly].first
      
      expect(current).to_not include(:pressure)
      expect(current).to_not include(:dew_point)
      expect(current).to_not include(:clouds)
      expect(current).to_not include(:wind_speed)
      expect(current).to_not include(:wind_deg)
      expect(real_current).to include(:pressure)
      expect(real_current).to include(:dew_point)
      expect(real_current).to include(:clouds)
      expect(real_current).to include(:wind_speed)
      expect(real_current).to include(:wind_deg)

      expect(day).to_not include(:moonrise)
      expect(day).to_not include(:moonset)
      expect(day).to_not include(:moon_phase)
      expect(day).to_not include(:feels_like)
      expect(real_day).to include(:moonrise)
      expect(real_day).to include(:moonset)
      expect(real_day).to include(:moon_phase)
      expect(real_day).to include(:feels_like)

      expect(hour).to_not include(:feels_like)
      expect(hour).to_not include(:pressure)
      expect(hour).to_not include(:humidity)
      expect(hour).to_not include(:dew_point)
      expect(hour).to_not include(:uvi)
      expect(hour).to_not include(:clouds)
      expect(hour).to_not include(:visibility)
      expect(hour).to_not include(:wind_speed)
      expect(hour).to_not include(:wind_deg)
      expect(hour).to_not include(:wind_gust)
      expect(hour).to_not include(:pop)
      expect(real_hour).to include(:feels_like)
      expect(real_hour).to include(:pressure)
      expect(real_hour).to include(:humidity)
      expect(real_hour).to include(:dew_point)
      expect(real_hour).to include(:uvi)
      expect(real_hour).to include(:clouds)
      expect(real_hour).to include(:visibility)
      expect(real_hour).to include(:wind_speed)
      expect(real_hour).to include(:wind_deg)
      expect(real_hour).to include(:wind_gust)
      expect(real_hour).to include(:pop)
    end
  end
end