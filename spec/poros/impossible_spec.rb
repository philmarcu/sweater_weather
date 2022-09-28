require 'rails_helper'

RSpec.describe Impossible, :vcr do
  it 'returns message and status for a failed route search' do
    data = JSON.parse(File.read('spec/fixtures/error.json'), symbolize_names: true)
    error = Impossible.new(data[:info])

    expect(error.message).to be_a String
    expect(error.status).to be_a Integer
  end
end