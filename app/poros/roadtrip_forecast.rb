class RoadtripForecast
  attr_reader :temperature,
              :conditions

  def initialize(data)
    @temperature = data[:temp]
    @conditions = data[:weather].first[:description]
  end
end