require 'rails_helper'

RSpec.describe 'WeatherFacade', :vcr do
  describe '#current' do
    it 'returns all current weather data' do
      lat =  39.738453
      long = -104.984853
      current = WeatherFacade.current(lat, long)

      expect(current).to be_a CurrentWeather
      expect(current.datetime).to be_a String
      expect(current.sunrise).to be_a String
      expect(current.sunset).to be_a String
    end
  end
end