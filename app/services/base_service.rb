class BaseService
  def self.mapquest_conn
    Faraday.new(url: 'http://www.mapquestapi.com/') do |f|
      f.params['key'] = ENV['mapquest_key']
    end
  end

  def self.weather_conn
    Faraday.new(url: 'https://api.openweathermap.org') do |f|
      f.params['appid'] = ENV['weather_key']
    end
  end

  def self.get_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end 
end