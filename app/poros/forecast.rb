class Forecast
  attr_reader :id,
              :current,
              :daily,
              :hourly
  def initialize(current, daily, hourly)
    @id = nil
    @current = current
    @daily = daily
    @hourly = hourly
  end
end