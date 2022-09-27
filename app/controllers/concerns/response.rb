module Response
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def json_create(object)
    render json: object, status: 201
  end
end