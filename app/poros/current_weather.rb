class CurrentWeather
  attr_reader :datetime,
              :sunrise,
              :sunset,
              :temp,
              :feels_like,
              :humidity,
              :uvi,
              :visibility,
              :conditions,
              :icon,
              :id
  def initialize(data)
    @id =         nil
    @datetime =   Time.at(data[:dt]).to_s
    @sunrise =    Time.at(data[:sunrise]).to_s
    @sunset =     Time.at(data[:sunset]).to_s
    @temp =       data[:temp]
    @feels_like = data[:feels_like]
    @humidity =   data[:humidity]
    @uvi =        data[:uvi]
    @visibility = data[:visibility]
    @conditions = data[:weather].first[:description]
    @icon =       data[:weather].first[:icon]
  end
end