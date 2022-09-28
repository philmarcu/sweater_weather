require 'rails_helper'

RSpec.describe 'MapQuestFacade', :vcr do
  describe '#coordinates' do
    it 'returns the coordinates' do
      map_quest = MapQuestFacade.coords("Denver,CO")

      expect(map_quest).to be_a MapQuest
      expect(map_quest.lat).to be_a Float
      expect(map_quest.lng).to be_a Float
    end
  end

  describe '#roadtrip' do
    it 'returns formatted info of a roadtrip' do
      start = "Denver, CO"
      finish = "Lander, WY"
      roadtrip = MapQuestFacade.roadtrip(start, finish)

      expect(roadtrip).to be_a Roadtrip
    end
  end
end