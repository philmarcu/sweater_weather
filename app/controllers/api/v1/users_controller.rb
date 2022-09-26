class Api::V1::UsersController < ApplicationController
  def create
    new_user = User.new(user_params)
    if new_user.save
      json_create(serializer(new_user))
    else
      render json: { status: 400, message: "#{new_user.errors.full_messages.join(" , ")}", data:{} }, status: :bad_request 
    end
  end
  
  private
  
  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
 
  def serializer(user)
    UserSerializer.new(user)
  end
end