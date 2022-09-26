class Books
  attr_reader :location,
              :total,
              :weather,
              :books
  def initialize(location, total, weather, books)
    @location = location
    @total = total
    @weather = weather
    @books = book
  end
end