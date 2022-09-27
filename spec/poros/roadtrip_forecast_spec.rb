require 'rails_helper'

RSpec.describe RoadtripForecast, :vcr do
  it 'creates a new weather object for roadtrip' do
    lat = 39.633321
    long = -105.317215

    eta = WeatherFacade.roadtrip(lat, long, 5)

    expect(eta).to be_a RoadtripForecast
    expect(eta.temperature).to be_a Numeric
    expect(eta.conditions).to be_a String
  end
end