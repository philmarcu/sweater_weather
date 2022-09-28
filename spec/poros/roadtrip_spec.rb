require 'rails_helper'

RSpec.describe Roadtrip, :vcr do
  it 'creates a new roadtrip object' do
    trip = MapQuestFacade.roadtrip("Denver, CO", "Roy, NM")

    expect(trip).to be_a Roadtrip
    expect(trip.start_city).to eq("Denver, CO")
    expect(trip.end_city).to eq("Roy, NM")
    expect(trip.travel_time).to include("hours", "minutes")
    expect(trip.weather_at_eta).to be_a RoadtripForecast
  end
end
