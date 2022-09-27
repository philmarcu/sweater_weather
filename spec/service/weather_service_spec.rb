require 'rails_helper'

RSpec.describe 'Weather One Call', :vcr do
  describe '#data' do
    it 'gets weather info from map quest lat / long' do
      lat =  39.738453
      long = -104.984853
      weather_data = WeatherService.data(lat, long)

      datetime = weather_data[:current][:dt]
      sunrise_utc = weather_data[:current][:sunrise]
      temperature = weather_data[:current][:temp]
      feels_like = weather_data[:current][:feels_like]
      humidity = weather_data[:current][:humidity]
      uvi = weather_data[:current][:uvi]
      visibility = weather_data[:current][:visibility]
      conditions = weather_data[:current][:weather].first[:description]
      icon = weather_data[:current][:weather].first[:icon]

      expect(weather_data).to be_a Hash
      expect(datetime).to be_a Integer
      expect(sunrise_utc).to be_a Integer
      expect(temperature).to be_a Float
      expect(feels_like).to be_a Float
      expect(humidity).to be_a Numeric
      expect(uvi).to be_a Numeric
      expect(visibility).to be_a Integer
      expect(conditions).to be_a String
      expect(icon).to be_a String
    end
  end
end