class LibraryFacade
  def self.books_forecast(location, qty)
    city = location[0..-4].downcase
    local = MapQuestFacade.coords(location)
    weather = WeatherFacade.library_call(local.lat, local.lng)
    results = LibraryService.get_books(city)
    total = results[:numFound]
    books = get_books(results, qty)
    Books.new(location, total, weather, books)
  end

  def self.get_books(data, qty)
    data[:docs].first(qty).map do |book_data|
      binding.pry
      Book.new(book_data)
    end
  end

  def self.get_publisher(olid)
    results = LibraryService.get_publishers(olid)
    results[:publishers].first if results[:publishers].present?
  end
end