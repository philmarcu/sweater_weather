class MapQuestService
  def self.latlong(location)
    response = BaseService.mapquest_conn.get("geocoding/v1/address?location=#{location}")
    BaseService.get_json(response)
  end

  def self.roadtrip(start, endpoint)
    response = BaseService.mapquest_conn.get("directions/v2/route?from=#{start}&to=#{endpoint}")
    BaseService.get_json(response)
  end
end