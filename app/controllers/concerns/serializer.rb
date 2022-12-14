module Serializer
  def w_serializer(facade)
    WeatherSerializer.new(facade)
  end

  def u_serializer(user)
    UserSerializer.new(user)
  end

  def r_serializer(trip)
    RoadtripSerializer.new(trip)
  end

  def i_serializer(error)
    ImpossibleSerializer.new(error)
  end
end