require 'rails_helper'

RSpec.describe 'Open Library Service', :vcr do
  describe 'book destination call' do
    # xit 'returns a number of books based on destination' do
    #   city = "denver"
    #   library_data = LibraryService.get_books(city)
    #   books = library_data[:works]

    #   expect(library_data).to be_a Hash
    #   expect(books).to be_a Array
    #   expect(books.size).to eq(12)
    # end

    # xit 'returns a number of publishers based off book olid' do
    #   publisher_data = LibraryService.get_publishers("OL12340667M")
    #   publisher = publisher_data[:publishers].first

    #   expect(publisher_data).to be_a Hash
    #   expect(publisher_data[:publishers]).to be_a Array
    #   expect(publisher).to be_a String
    # end

    it 'returns a number of books from search' do
      city = "denver,co"
      library_data = LibraryService.get_books(city)
      books = library_data[:docs]

      expect(library_data).to be_a Hash
      expect(books).to be_a Array

      books.first(5).each do |book|
        expect(book[:title]).to be_a String
        expect(book[:isbn].first).to be_a String
        expect(book[:publisher].first).to be_a String
      end
    end
  end
end