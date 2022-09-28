require 'rails_helper'

RSpec.describe MapQuestService, :vcr do
  describe '#mapquest_latlong' do
    it 'gets the latitude and longitude from a city + state' do
      coords = MapQuestService.latlong("Denver,CO")
      lat = coords[:results].first[:locations].first[:latLng][:lat]
      long = coords[:results].first[:locations].first[:latLng][:lng]

      expect(coords).to be_a(Hash)
      expect(lat).to be_a(Float)
      expect(long).to be_a(Float)
    end
  end

  describe '#roadtrip' do
    it 'sends user roadtrip info about 2 places' do
      location = "Denver, CO"
      destination = "Lander, WY"
      results = MapQuestService.roadtrip(location, destination)
      travel_time = results[:route][:formattedTime]
      
      expect(results).to be_a Hash
      expect(travel_time).to be_a String
    end
  end
end