require 'rails_helper'

RSpec.describe Forecast do
  it 'contains the current + daily + hourly weather' do
    current_data = JSON.parse(File.read('spec/fixtures/current_weather.json'), symbolize_names: true)
    daily_data = JSON.parse(File.read('spec/fixtures/daily_weather.json'), symbolize_names: true)
    hourly_data = JSON.parse(File.read('spec/fixtures/hourly_weather.json'), symbolize_names: true)
    current = CurrentWeather.new(current_data)
    daily = daily_data.map { |d| DailyWeather.new(d) }
    hourly = hourly_data.map { |h| HourlyWeather.new(h) }

    forecast = Forecast.new(current, daily, hourly)
    day = forecast.daily.first
    hour = forecast.hourly.first

    expect(forecast).to be_a Forecast
    expect(forecast.current).to be_a CurrentWeather
    expect(forecast.daily).to be_a Array
    expect(forecast.hourly).to be_a(Array)
    expect(day).to be_a DailyWeather
    expect(hour).to be_a HourlyWeather
  end
end