class WeatherService
  def self.data(lat, long)
    response = BaseService.weather_conn.get("data/3.0/onecall?exclude=minutely&lat=#{lat}&lon=#{long}&units=imperial")
    BaseService.get_json(response)
  end
end