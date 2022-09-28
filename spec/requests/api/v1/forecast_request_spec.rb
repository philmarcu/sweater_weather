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
      
      expect(real_current).to include(:pressure, :dew_point, :clouds, :wind_speed, :wind_deg)
      expect(real_day).to include(:moonrise, :moonset, :moon_phase, :feels_like)
      expect(real_hour).to include(:feels_like, :pressure, :humidity, :dew_point, :uvi, :clouds, :visibility, :wind_speed, :wind_deg, :wind_gust, :pop)
      
      expect(current).to_not include(:pressure, :dew_point, :clouds, :wind_speed, :wind_deg)
      expect(day).to_not include(:moonrise, :moonset, :moon_phase, :feels_like)
      expect(hour).to_not include(:feels_like, :pressure, :humidity, :dew_point, :uvi, :clouds, :visibility, :wind_speed, :wind_deg, :wind_gust, :pop)
    end
  end
end