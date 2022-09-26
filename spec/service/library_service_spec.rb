require 'rails_helper'

RSpec.describe 'Open Library Service', :vcr do
  describe 'book destination call' do
    it 'returns a number of books based on destination' do
      city = "denver"

      library_data = LibraryService.get_books(city)
      books = library_data[:works]

      binding.pry

      expect(library_data).to be_a Hash
      expect(books).to be_a Array
      expect(books.size).to eq(5)
    end
  end
end