class Api::V1::WeatherController < ApplicationController
  before_action :set_location
  def forecast
    json_response(w_serializer(WeatherFacade.forecast(@lat, @long)))
  end
end