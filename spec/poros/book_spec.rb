require 'rails_helper'

RSpec.describe Book do
  it 'contains book title + other info' do
    data = JSON.parse(File.read('spec/fixtures/book.json'), symbolize_names: true)
    book = Book.new(data)
  end
end