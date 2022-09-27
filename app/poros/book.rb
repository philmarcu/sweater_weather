class Book
  attr_reader :title,
              :publisher,
              :isbn,
              :olid
  def initialize(data)
    @title = data[:title]
    @isbn = data[:isbn].first if data[:isbn].present?
    @publisher = data[:publisher].first if data[:publisher].present?
  end
end