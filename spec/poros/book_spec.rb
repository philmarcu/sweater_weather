require 'rails_helper'

RSpec.describe Book, :vcr do
  it 'contains book title + other info' do
    data = JSON.parse(File.read('spec/fixtures/book.json'), symbolize_names: true)
    book = Book.new(data)

    expect(book).to be_a Book
    expect(book.title).to eq("Boldfaced Lies")
    expect(book.publisher).to eq("Rose City Press")
    expect(book.isbn).to eq("1934099112")
  end
end