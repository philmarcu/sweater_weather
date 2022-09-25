require 'rails_helper'

RSpec.describe DailyWeather do
  it 'returns a weather object' do
    daily_data = JSON.parse(File.read('spec/fixtures/daily_weather.json'), symbolize_names: true)
    daily = DailyWeather.new(daily_data.first)

    expect(daily).to be_a DailyWeather
    expect(daily.date).to eq("2022-09-24")
    expect(daily.sunrise).to eq("2022-09-24 06:49:26 -0600")
    expect(daily.sunset).to eq("2022-09-24 18:54:23 -0600")
    expect(daily.max_temp).to eq(82.13)
    expect(daily.min_temp).to eq(59.4)
    expect(daily.conditions).to eq("clear sky")
    expect(daily.icon).to eq("01d")
  end
end