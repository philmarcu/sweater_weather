require 'rails_helper'

RSpec.describe CurrentWeather do
  it 'returns a weather object' do
    data = JSON.parse(File.read('spec/fixtures/current_weather.json'), symbolize_names: true)
    current = CurrentWeather.new(data)

    expect(current).to be_a CurrentWeather
    expect(current.datetime).to eq(Time.at(data[:dt]).to_s)
    expect(current.sunrise).to eq(Time.at(data[:sunrise]).to_s)
    expect(current.sunset).to eq(Time.at(data[:sunset]).to_s)
    expect(current.temp).to eq(293.4)
    expect(current.feels_like).to eq(292.26)
    expect(current.humidity).to eq(30)
    expect(current.uvi).to eq(0)
    expect(current.visibility).to eq(10000)
    expect(current.conditions).to eq("clear sky")
    expect(current.icon).to eq("01n")
  end
end