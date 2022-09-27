module Serializer
  def w_serializer(facade)
    WeatherSerializer.new(facade)
  end

  def u_serializer(user)
    UserSerializer.new(user)
  end
end