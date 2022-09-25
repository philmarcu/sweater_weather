class WeatherFacade
  def self.current(lat, long)
    results = WeatherService.data(lat, long)
    CurrentWeather.new(results[:current])
  end

  def self.daily(lat, long)
    results = WeatherService.data(lat, long)[:daily]
    results.each_with_index.map do |daily_data, idx|
      until idx > 4
        DailyWeather.new(daily_data)
      end
    end
  end

  def self.hourly(lat, long)
    results = WeatherService.data(lat, long)[:hourly]
    results[:hourly].each_with_index.map do |hour_data, idx|
      until idx > 7
        HourlyWeather.new(hour_data)
      end
    end
  end
end