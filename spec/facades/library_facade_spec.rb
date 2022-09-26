require 'rails_helper'

RSpec.describe 'LibraryFacade', :vcr do
  describe '#get_books' do
    it 'formats the books found by library service' do
      books = LibraryFacade.get_books("denver")

      expect(books).to be_a Array
    end

    it 'can get publishers' do
      publishers = LibraryFacade.get_publisher("OL12340667M")
      expect(publishers).to be_a Array
      expect(publishers).to be_a String
    end
  end
end