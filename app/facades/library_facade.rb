class LibraryFacade
  def self.get_books(city)
    results = LibraryService.get_books(city)
    results[:works].map do |book_data|
      Book.new(book_data)
    end
  end

  def self.get_publisher(isbn)
    results = LibraryService.get_books(isbn)
    results[:publishers]
  end
end