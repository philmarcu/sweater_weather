require 'rails_helper'

RSpec.describe 'Books Request', :vcr do
  it 'can send book info with forecast to user' do
    location = "Denver,CO"    
    qty = 5
    parsed = JSON.parse(File.read('spec/fixtures/books_call.json'), symbolize_names: true)

    get "/api/v1/book-search?location=#{location}&quantity=#{qty}"

    attributes = parsed[:data][:attributes]
    type = parsed[:data][:type]
    books = parsed[:data][:attributes][:books]
    
    expect(parsed).to be_a Hash
    expect(parsed[:data]).to be_a Hash
    expect(type).to eq("books")
    expect(books.size).to eq(5)
    expect(attributes.keys).to include(:destination, :total_books, :forecast, :books)
  end
end