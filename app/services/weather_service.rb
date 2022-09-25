class WeatherService
  def self.data(lat, long)
    response = BaseService.weather_conn.get("data/3.0/onecall?lat=#{lat}&lon=#{long}")
    BaseService.get_json(response)
  end
end