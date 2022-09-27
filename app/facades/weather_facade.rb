class WeatherFacade
  def self.forecast(lat, long)
    data = WeatherService.data(lat, long)
    curr = current(data[:current])
    day = daily(data[:daily][0..4])
    hr = hourly(data[:hourly][0..7])
    Forecast.new(curr, day, hr)
  end

  def self.current(data)
    CurrentWeather.new(data)
  end

  def self.daily(data)
    data.map do |day|
      DailyWeather.new(day)
    end
  end

  def self.hourly(data)
    data.map do |hour|
      HourlyWeather.new(hour)
    end
  end

  def self.weather_eta(data)
    RoadtripForecast.new(data)
  end

  def self.roadtrip(lat, long, arrival_hr)
    hours = WeatherService.data(lat, long)[:hourly]
    weather_eta(hours[arrival_hr])
  end
end