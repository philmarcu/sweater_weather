class Api::V1::UsersController < ApplicationController
  def create
    if email_valid?     
      new_user = User.new(user_params)
      if new_user.save
        json_create(u_serializer(new_user))
      else
        json_error(new_user)
      end
    else
      user_error("Invalid email, please try again")
    end
  end
  
  private
  
  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

  def email_valid?
    valid_email(params[:email])
  end
end