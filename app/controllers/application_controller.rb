class ApplicationController < ActionController::API
  include ActionController::Helpers
  include ExceptionHandler
  include Response
  helper_method :set_location

  private

  def set_location
    mapquest = MapQuestFacade.coords(params[:location])
    @lat = mapquest.lat
    @long = mapquest.lng
  end
end
