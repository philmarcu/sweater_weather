class WeatherFacade
  def self.one_call(lat, long)
    results = WeatherService.data(lat, long)
    CurrentWeather.new(results[:current])

    results[:daily].map do |daily_data|
      DailyWeather.new(daily_data)
    end

    results[:hourly].map do |hour_data|
      HourlyWeather.new(hour_data)
    end
  end
end