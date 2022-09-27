class MapQuestFacade
  def self.coords(state)
    results = MapQuestService.latlong(state)[:results]
    data = results.first[:locations].first[:latLng]
    MapQuest.new(data)
  end

  def self.roadtrip(start, finish)
    results = MapQuestService.roadtrip(start, finish)[:route]
    if results[:routeError][:errorCode] == -400
      Roadtrip.new(results)
    else
      { origin: start, end: finish, message: "Impossible Route" }
    end
  end
end