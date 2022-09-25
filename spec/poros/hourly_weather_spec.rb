require 'rails_helper'

RSpec.describe HourlyWeather do
  it 'returns a weather object' do
    hourly_data = JSON.parse(File.read('spec/fixtures/hourly_weather.json'), symbolize_names: true)
    hourly = HourlyWeather.new(hourly_data.first)

    expect(hourly).to be_a HourlyWeather
    expect(hourly.time).to eq("22:00:00")
    expect(hourly.temp).to eq(61.79)
    expect(hourly.conditions).to eq("clear sky")
    expect(hourly.icon).to eq("01n")
  end
end