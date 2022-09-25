class HourlyWeather
  attr_reader :time,
              :temp,
              :conditions,
              :icon
  def initialize(data)
    @time =       Time.at(data[:dt]).to_s[11..18]
    @temp =       data[:temp]
    @conditions = data[:weather].first[:description]
    @icon =       data[:weather].first[:icon]
  end
end