class BooksSerializer
  include JSONAPI::Serializer
  set_id :id
  set_type :books
  attributes :destination, :total_books, :forecast, :books
end
