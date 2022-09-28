class Api::V1::RoadtripController < ApplicationController
  def create
    if key_valid?
      roadtrip = MapQuestFacade.roadtrip(params[:origin], params[:destination])
      if roadtrip.class != Roadtrip
        json_response(i_serializer(roadtrip))
      else
        json_response(r_serializer(roadtrip))
      end
    else
      unauthorized("Invalid access, user must be logged in")
    end
  end

  private

  def key_valid?
    key = ApiKey.find_by(access_token: params[:api_key])
    key.present?
  end
end