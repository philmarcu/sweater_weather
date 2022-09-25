require 'rails_helper'

RSpec.describe 'MapQuestService', :vcr do
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
end