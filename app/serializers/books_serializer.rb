class BooksSerializer
  include JSONAPI::Serializer
  set_id :id
  set_type :books
  attributes :location, :total, :weather, :books
end
