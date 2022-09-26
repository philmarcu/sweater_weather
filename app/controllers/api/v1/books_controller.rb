class Api::V1::BooksController < ApplicationController
  def search
    json_response(serializer(LibraryFacade.books_forecast(params[:location], params[:quantity].to_i)))
  end

  def serializer(facade)
    BooksSerializer.new(facade)
  end
end