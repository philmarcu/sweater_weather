class BookSearch
  attr_reader :destination,
              :total_books,
              :forecast,
              :books,
              :id
  def initialize(destination, total_books, forecast, books)
    @id = nil
    @destination = destination.downcase
    @total_books = total_books
    @forecast = forecast
    @books = books
  end
end