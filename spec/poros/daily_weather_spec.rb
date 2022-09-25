require 'rails_helper'

RSpec.describe DailyWeather do
  it 'returns a weather object' do
    daily_data = JSON.parse(File.read('spec/fixtures/daily_weather.json'), symbolize_names: true)
    weather = DailyWeather.new(daily_data.first)

    expect(weather).to be_a DailyWeather
    expect(weather.date).to eq("2022-09-24")
    expect(weather.sunrise).to eq("2022-09-24 06:49:26 -0600")
    expect(weather.sunset).to eq("2022-09-24 18:54:23 -0600")
    expect(weather.max_temp).to eq(82.13)
    expect(weather.min_temp).to eq(59.4)
    expect(weather.conditions).to eq("clear sky")
    expect(weather.icon).to eq("01d")
  end
end