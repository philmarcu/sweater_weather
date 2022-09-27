class Api::V1::UsersController < ApplicationController
  def create
    new_user = User.new(user_params)
    if new_user.save
      json_create(u_serializer(new_user))
    else
      json_error(new_user)
    end
  end
  
  private
  
  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end