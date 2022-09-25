class WeatherFacade
  def self.current(lat, long)
    results = WeatherService.data(lat, long)
    CurrentWeather.new(results[:current])
  end

  def self.daily(lat, long)
    results = WeatherService.data(lat, long)[:daily]
    results.first(5).map do |daily_data|
        DailyWeather.new(daily_data)
    end
  end

  def self.hourly(lat, long)
    results = WeatherService.data(lat, long)[:hourly]
    results.first(8).map do |hour_data|
        HourlyWeather.new(hour_data)
    end
  end
end