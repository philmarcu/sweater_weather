require 'rails_helper'

RSpec.describe 'WeatherFacade', :vcr do
  describe '#one_call' do
    it 'returns all current weather data' do
      lat =  39.738453
      long = -104.984853
      results = WeatherFacade.one_call(lat, long)
      binding.pry
      expect(results).to be_a Hash
    end
  end
end