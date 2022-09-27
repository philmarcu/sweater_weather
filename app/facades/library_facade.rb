class LibraryFacade
  def self.books_forecast(location, qty)
    local = MapQuestFacade.coords(location)
    weather = WeatherFacade.library_call(local.lat, local.lng)
    results = LibraryService.get_books(location.downcase)
    total = results[:numFound]
    books = get_books(results, qty)
    BookSearch.new(location, total, weather, books)
  end

  def self.get_books(data, qty)
    data[:docs].first(qty).map do |book_data|
      Book.new(book_data)
    end
  end
end