require 'rails_helper'

RSpec.describe 'LibraryFacade', :vcr do
  describe '#get_books' do
    it 'formats the books found by library service' do
      books = LibraryFacade.get_books("denver")

      expect(books).to be_a Array
    end

    it 'can get publishers' do
      publishers = LibraryFacade.get_publisher("1934099112")

      expect(publishers).to be_a Array
    end
  end
end