require_relative './classes/list_books'
require_relative './classes/list_people'
require_relative './classes/create_person'
require_relative './classes/create_book'
require_relative './classes/create_rental'
require_relative './classes/display_rentals'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def run
    puts "\nWelcome to School Library App!"
    puts "\nPlease choose an option by entering a number:"
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a giver person id'
    puts '7 - Exit'
    selector = gets.chomp.to_i
    cases_method(selector)
  end

  def exit_app
    at_exit do
      puts 'Thank you for using this app!'
    end
    exit(true)
  end

  def cases_method(selector)
    case selector
    when 1
      ListBooks.new.list_books(@books)
      run
    when 2
      ListPeople.new.list_people(@people)
      run
    when 3
      CreatePerson.new.create_person(@people)
      run
    when 4
      CreateBook.new.create_book(@books)
      run
    when 5
      CreateRental.new.create_rental(@books, @people)
      run
    when 6
      DisplayRentals.new.display_rentals_by_id(@people)
      run
    when 7
      exit_app
    end
  end
end

def main
  app = App.new
  app.run
end

main
