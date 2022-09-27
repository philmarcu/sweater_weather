module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ message: e.message }, :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      json_response({ message: e.message }, :unprocessable_entity)
    end
  end

  def json_error(user)
    render json: { status: 400, message: "#{user.errors.full_messages.join(" , ")}", data:{} }, status: :bad_request 
  end
end