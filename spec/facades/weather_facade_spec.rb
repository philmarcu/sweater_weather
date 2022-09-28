require 'rails_helper'

RSpec.describe 'WeatherFacade', :vcr do
  let(:curr)  { JSON.parse(File.read('spec/fixtures/current_weather.json'), symbolize_names: true) }
  let(:day) { JSON.parse(File.read('spec/fixtures/daily_weather.json'), symbolize_names: true) }
  let(:hr) { JSON.parse(File.read('spec/fixtures/hourly_weather.json'), symbolize_names: true) }
  let(:lat) { 39.73 }
  let(:long) { -104.98 }

  describe '#current' do
    it 'returns all current weather data' do
      current = WeatherFacade.current(curr)

      expect(current).to be_a CurrentWeather
      expect(current.datetime).to be_a String
      expect(current.sunrise).to be_a String
      expect(current.sunset).to be_a String
      expect(current.temp).to be_a Numeric
      expect(current.feels_like).to be_a Numeric
      expect(current.humidity).to be_a Numeric
      expect(current.uvi).to be_a Numeric
      expect(current.visibility).to be_a Numeric
      expect(current.conditions).to be_a String
      expect(current.icon).to be_a String
    end
  end

  describe '#daily' do
    it 'returns all daily weather data' do
      dailies = WeatherFacade.daily(day)
      
      dailies.each do |day|
        expect(day).to be_a DailyWeather
        expect(day.date).to be_a String
        expect(day.sunrise).to be_a String
        expect(day.sunset).to be_a String
        expect(day.max_temp).to be_a Numeric
        expect(day.min_temp).to be_a Numeric
        expect(day.conditions).to be_a String
        expect(day.icon).to be_a String
      end
    end
  end

  describe '#hourly' do
    it 'returns all hourly weather data' do
      hourlies = WeatherFacade.hourly(hr)

      hourlies.each do |hr|
        expect(hr).to be_a HourlyWeather
        expect(hr.time).to be_a String
        expect(hr.temp).to be_a Numeric
        expect(hr.conditions).to be_a String
        expect(hr.icon).to be_a String
      end
    end
  end

  describe '#forecast' do
    it 'returns all 3 other forecasts into one object' do
      forecast = WeatherFacade.forecast(lat, long)

      expect(forecast).to be_a Forecast
      expect(forecast.current).to be_a CurrentWeather
      expect(forecast.daily).to be_a Array
      expect(forecast.hourly).to be_a Array
    end
  end

  describe '#roadtrip' do
    it 'returns one hour of weather data at location' do
      lat = 39.633321
      long = -105.317215
      
      roadtrip = WeatherFacade.roadtrip(lat, long, 5)

      expect(roadtrip).to be_a RoadtripForecast
    end
  end
end