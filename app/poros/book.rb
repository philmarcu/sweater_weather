class Book
  attr_reader :title,
              :publisher,
              :isbn,
              :olid
  def initialize(data)
    @title = data[:title]
    @isbn = data[:availability][:isbn] if data[:availability].present?
    @olid = data[:cover_edition_key]
    @publisher = find_publisher
  end

  def find_publisher
    LibraryFacade.get_publisher(@olid)
  end
end