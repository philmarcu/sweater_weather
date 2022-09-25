require 'rails_helper'

RSpec.describe 'Forecast Request' do
  context '#forecast_serializer' do
    it 'sends response with current + daily + hourly weather' do
      
      get "api/v1/forecast?location=#{location}"

      expect(response).to be_successful
    end
  end
end