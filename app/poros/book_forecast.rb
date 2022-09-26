class BookForecast
  attr_reader :temp,
              :summary
  def initialize(data)
    @temp = data[:temp] 
    @summary = data[:weather].first[:description]
  end
end