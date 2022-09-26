require 'rails_helper'

RSpec.describe 'LibraryFacade', :vcr do
  describe '#get_books' do
    it 'formats the books found by library service' do
      json = JSON.parse(File.read('spec/fixtures/books.json'), symbolize_names: true)

      books = LibraryFacade.get_books(json)
      book = books.first

      expect(books).to be_a Array
      expect(book.title).to be_a String
      expect(book.publisher).to be_a String
      expect(book.olid).to be_a String
      expect(book.isbn).to be_a String
    end

    it 'can get publishers' do
      publisher = LibraryFacade.get_publisher("OL12340667M")

      expect(publisher).to be_a String
    end

    it 'can get a books forecast' do
      location = "Denver,CO"
      city = "denver"

      book_call = LibraryFacade.books_forecast(location)

      expect(book_call).to be_a Hash
    end
  end
end