require 'rails_helper'

RSpec.describe Roadtrip, :vcr do
  it 'creates a new roadtrip object' do
    trip = MapQuestFacade.roadtrip("Denver, CO", "Roy, NM")

    expect(trip).to be_a Roadtrip
    expect(trip.start).to eq("Denver, CO")
    expect(trip.finish).to eq("Roy, NM")
    expect(trip.time_format).to include("hours", "minutes")
  end

  it 'can get the arrival hour weather' do
    trip = MapQuestFacade.roadtrip("Denver, CO", "Roy, NM")

    expect(trip.forecast).to be_a WeatherETA
  end
end
