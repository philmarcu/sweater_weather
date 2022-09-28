class ApplicationController < ActionController::API
  include ActionController::Helpers
  include ExceptionHandler
  include Response
  include Serializer

  helper_method :set_location, :valid_email

  def set_location
    mapquest = MapQuestFacade.coords(params[:location])
    @lat = mapquest.lat
    @long = mapquest.lng
  end
end
