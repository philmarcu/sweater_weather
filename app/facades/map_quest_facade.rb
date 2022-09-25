class MapQuestFacade
  def self.coords(state)
    results = MapQuestService.latlong(state)[:results]
    data = results.first[:locations].first[:latLng]
    MapQuest.new(data)
  end
end