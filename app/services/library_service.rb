class LibraryService
  def self.get_books(city)
    response = BaseService.library_conn.get("search.json?subjects=#{city}")
    BaseService.get_json(response)
  end

  def self.get_publishers(olid)
    response = BaseService.library_conn.get("/books/#{olid}.json")
    BaseService.get_json(response)
  end
end