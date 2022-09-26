require 'rails_helper'

RSpec.describe 'Books Request', :vcr do
  it 'can send book info with forecast to user' do
    location = "Denver,CO"
    parsed = JSON.parse(response.body, symbolize_names: true)

    get ""

    expect(parsed).to be_a Hash
  end
end