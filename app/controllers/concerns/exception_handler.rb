module ExceptionHandler
  def json_error(user)
    render json: { status: 400, message: "#{user.errors.full_messages.join(" , ")}", data:{} }, status: :bad_request 
  end

  def user_error(message)
    render json: message, status: 400
  end

  def unauthorized(message)
    render json: message, status: 401
  end

  def valid_email(email)
    email.include?("@") && email.include?(".")
  end
end