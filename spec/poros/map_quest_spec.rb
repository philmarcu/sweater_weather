require 'rails_helper'

RSpec.describe MapQuest do
  it 'returns an object with lat / long attributes' do
    data = { :lat => 39.73, lng: 104.98 }
    map_quest = MapQuest.new(data)

    expect(map_quest).to be_a MapQuest
    expect(map_quest.lat).to eq(data[:lat])
    expect(map_quest.lng).to eq(data[:lng])
  end
end