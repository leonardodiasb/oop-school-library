require './rental'

class Book
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  attr_reader :rentals
  attr_accessor :title, :author

  def add_rental(_book)
    Rental.new(date, self, person)
  end
end
