class Book
  attr_reader :title,
              :publisher,
              :isbn
  def initialize(data)
    @title = data[:title]
    @isbn = data[:availability][:isbn]
    @publisher = find_publisher
    @key = data[:cover_edition_key]
  end

  def self.find_publisher
    LibraryFacade.get_publisher(@key)
  end
end