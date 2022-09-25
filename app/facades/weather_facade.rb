class WeatherFacade
  def self.one_call(lat, long)
    results = WeatherService.data(lat, long)
    Current_Weather.new(results[:current])
    Daily_Weather.new(results[:daily])
    Hourly_Weather.new(results[:hourly])
  end
end