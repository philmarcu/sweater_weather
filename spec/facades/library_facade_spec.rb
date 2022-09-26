require 'rails_helper'

RSpec.describe 'LibraryFacade', :vcr do
  describe '#get_books' do
    it 'formats the books found by library service' do
      json = JSON.parse(File.read('spec/fixtures/books.json'), symbolize_names: true)
      unformatted_books = json[:works]
      books = LibraryFacade.get_books(json, 5)
      book = books.first
      
      expect(json).to be_a Hash
      expect(unformatted_books.size).to eq(12)
      expect(books).to be_a Array
      expect(books.size).to eq(5)
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

      book_call = LibraryFacade.books_forecast(location, 5)

      expect(book_call).to be_a Books
    end
  end
end