class Api::V1::RoadtripController < ApplicationController
  def create
    if params[:api_key]
      roadtrip = MapQuestFacade.roadtrip(params[:origin], params[:destination])
      json_response(r_serializer(roadtrip))
    else
      "Invalid access, must be logged in"
    end
  end
end