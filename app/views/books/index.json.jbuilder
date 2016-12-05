json.array!(@books) do |book|
  json.extract! book, :id, :title, :BookCode, :author, :numOfCopies, :popularity, :image
  json.url book_url(book, format: :json)
end
