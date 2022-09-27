class Roadtrip
  attr_reader :start,
              :finish,
              :duration,
              :lat,
              :long, 
              :hour
  def initialize(data)
    @start = data[:locations].first[:adminArea5] + ", " +  data[:locations].first[:adminArea3]
    @finish = data[:locations].last[:adminArea5] + ", " +  data[:locations].last[:adminArea3]
    @duration = data[:formattedTime]
    @lat = data[:locations].last[:displayLatLng][:lat]
    @long = data[:locations].last[:displayLatLng][:long]
    @forecast = arrival_weather
  end

  def time_format
    dt = @duration.to_datetime
    dt.strftime("%I hours, %M minutes")
  end

  def arrival_weather
    hr = @duration.first(2).to_i
    binding.pry
  end
end