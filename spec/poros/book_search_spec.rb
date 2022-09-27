require 'rails_helper'

RSpec.describe BookSearch, :vcr do
  it 'has objects with request info' do
    location = "denver,co"
    book_search = LibraryFacade.books_forecast(location, 5)
    book = book_search.books.first

    expect(book_search).to be_a BookSearch
    expect(book_search.forecast).to be_a BookForecast
    expect(book_search.destination).to eq(location)
    expect(book_search.total_books).to be_a Integer
    expect(book_search.id).to eq(nil)
    expect(book).to be_a Book
  end
end