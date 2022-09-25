class WeatherSerializer
  include JSONAPI::Serializer
  set_id :id
  set_type :forecast
  attributes :current, :hourly, :daily
end
