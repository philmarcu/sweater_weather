class Book
  attr_reader :title,
              :publisher,
              :isbn
  def initialize(data)
    @title = data[:title]
    @isbn = data[:availability][:isbn]
    @publisher = find_publisher
  end

  def self.find_publisher
    LibraryFacade.get_publisher(@isbn)
  end
end