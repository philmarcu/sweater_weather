class MapQuestFacade
  def self.coords(state)
    results = MapQuestService.latlong(state)[:results]
    data = results.first[:locations].first[:latLng]
    MapQuest.new(data)
  end

  def self.roadtrip(start, finish)
    results = MapQuestService.roadtrip(start, finish)
    if results[:route][:routeError][:errorCode] == -400
      Roadtrip.new(results[:route])
    else
      trip_error(results)
    end
  end

  def self.trip_error(results)
    Impossible.new(results[:info])
  end
end