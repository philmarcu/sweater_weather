require 'rails_helper'

RSpec.describe 'WeatherFacade', :vcr do
  let(:lat)  { 39.738453 }
  let(:long) { -104.984853 }

  describe '#current' do
    it 'returns all current weather data' do
      current = WeatherFacade.current(lat, long)

      expect(current).to be_a CurrentWeather
      expect(current.datetime).to be_a String
      expect(current.sunrise).to be_a String
      expect(current.sunset).to be_a String
      expect(current.temp).to be_a Float
      expect(current.feels_like).to be_a Float
      expect(current.humidity).to be_a Integer
      expect(current.uvi).to be_a Integer
      expect(current.visibility).to be_a Integer
      expect(current.conditions).to be_a String
      expect(current.icon).to be_a String
    end
  end

  describe '#daily' do
    it 'returns all daily weather data' do
      dailies = WeatherFacade.daily(lat, long)
      
      dailies.each do |day|
        expect(day).to be_a DailyWeather
        expect(day.date).to be_a String
        expect(day.sunrise).to be_a String
        expect(day.sunset).to be_a String
        expect(day.max_temp).to be_a Float
        expect(day.min_temp).to be_a Float
        expect(day.conditions).to be_a String
        expect(day.icon).to be_a String
      end
    end
  end

  describe '#hourly' do
    it 'returns all hourly weather data' do
      hourlies = WeatherFacade.hourly(lat, long)

      hourlies.each do |hr|
        expect(hr).to be_a HourlyWeather
        expect(hr.time).to be_a String
        expect(hr.temp).to be_a Float
        expect(hr.conditions).to be_a String
        expect(hr.icon).to be_a String
      end
    end
  end
end