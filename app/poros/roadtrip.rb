class Roadtrip
  attr_reader :id,
              :start_city,
              :end_city,
              :duration,
              :lat,
              :long, 
              :weather_at_eta,
              :travel_time
  def initialize(data)
    @id = nil
    @start_city = data[:locations].first[:adminArea5] + ", " +  data[:locations].first[:adminArea3]
    @end_city = data[:locations].last[:adminArea5] + ", " +  data[:locations].last[:adminArea3]
    @duration = data[:formattedTime]
    @lat = data[:locations].last[:displayLatLng][:lat]
    @long = data[:locations].last[:displayLatLng][:lng]
    @weather_at_eta = arrival_weather
    @travel_time = time_format
  end

  def time_format
    dt = @duration.to_datetime
    dt.strftime("%-l hours, %M minutes")
  end

  def arrival_weather
    hr = @duration.first(2).to_i
    WeatherFacade.roadtrip(@lat, @long, hr)
  end
end