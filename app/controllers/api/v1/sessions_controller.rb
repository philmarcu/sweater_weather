class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      json_response(u_serializer(user))
    else
      user_error("Invalid credentials, please try again")
    end
  end
end