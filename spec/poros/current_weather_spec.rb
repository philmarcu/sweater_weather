require 'rails_helper'

RSpec.describe CurrentWeather do
  it 'is a weather object' do
    data = {
      "dt": 1664069761,
        "sunrise": 1664023766,
        "sunset": 1664067263,
        "temp": 293.4,
        "feels_like": 292.26,
        "pressure": 1019,
        "humidity": 30,
        "dew_point": 275.28,
        "uvi": 0,
        "clouds": 0,
        "visibility": 10000,
        "wind_speed": 3.09,
        "wind_deg": 90,
        "weather": [
            {
                "id": 800,
                "main": "Clear",
                "description": "clear sky",
                "icon": "01n"
            }
          ]
        }

    current = CurrentWeather.new(data)

    expect(current).to be_a CurrentWeather
    expect(current.id).to eq(nil)
    expect(current.datetime).to eq(Time.at(data[:dt]))
    expect(current.sunrise).to eq(Time.at(data[:sunrise]))
    expect(current.sunset).to eq(Time.at(data[:sunset]))
    expect(current.temp).to eq(293.4)
    expect(current.feels_like).to eq(292.26)
    expect(current.humidity).to eq(30)
    expect(current.uvi).to eq(0)
    expect(current.visibility).to eq(10000)
    expect(current.conditions).to eq("clear sky")
    expect(current.icon).to eq("01n")
  end
end