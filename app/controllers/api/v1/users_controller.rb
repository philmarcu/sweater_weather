class Api::V1::UsersController < ApplicationController
  def create
    if pwd_match? && !exist?
      new_user = User.new(user_params)
      if new_user.save
        json_create(serializer(new_user))
      end
    elsif exist?
      json_error("A user already exists with this email")
    else
      json_error("Passwords must match")
    end
  end

  def user_params
    params.permit(:email, :password, :password_confirm, :api_key)
  end

  private

  def pwd_match?
    params[:password] == params[:password_confirmation]
  end

  def exist?
    if User.find_by(email: params[:email]) != nil
      true
    end
  end

  def serializer(user)
    UserSerializer.new(user)
  end
end