class ListBooks
  def list_books(books)
    (0..books.length - 1).each do |i|
      puts "Title: '#{books[i].title}', Author #{books[i].author}"
    end
  end
end
