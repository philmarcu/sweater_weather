class LibraryService
  def self.get_books(city)
    response = BaseService.library_conn.get("subjects/#{city}.json?limit=5&details=true")
    BaseService.get_json(response)
  end

  def self.get_publishers(olid)
    response = BaseService.library_conn.get("/books/#{olid}.json")
    BaseService.get_json(response)
  end
end