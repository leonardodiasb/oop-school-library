require_relative './book'

class CreateBook
  def create_book(books)
    print 'Title:'
    title = gets.chomp
    print 'Author:'
    author = gets.chomp
    books << Book.new(title, author)
  end
end
