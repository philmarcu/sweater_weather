class Api::V1::WeatherController < ApplicationController
  before_action :set_location
  def forecast
    json_response(serializer(WeatherFacade.forecast(@lat, @long)))
  end

  private

  def serializer(facade)
    WeatherSerializer.new(facade)
  end
end