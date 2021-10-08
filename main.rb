require_relative './classes/book'
require_relative './classes/classroom'
require_relative './classes/corrector'
require_relative './classes/person'
require_relative './classes/rental'
require_relative './classes/student'
require_relative './classes/teacher'

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

  def list_books
    (0..@books.length - 1).each do |i|
      puts "Title: '#{@books[i].title}', Author #{@books[i].author}"
    end
    run
  end

  def list_people
    (0..@people.length - 1).each do |i|
      puts "[#{@people[i].class}] Name:'#{@people[i].name}', ID:#{@people[i].id}, Age:#{@people[i].age}"
    end
    run
  end

  def create_student
    print 'Age:'
    age = gets.chomp.to_i
    print 'Name:'
    name = gets.chomp
    print 'Has parent permission? [Y/N]:'
    parent_permission = gets.chomp
    @people << Student.new(age, name, parent_permission)
  end

  def create_teacher
    print 'Age:'
    age = gets.chomp.to_i
    print 'Name:'
    name = gets.chomp
    print 'Specialization:'
    specialization = gets.chomp
    @people << Teacher.new(age, name, specialization)
  end

  def create_person
    puts 'Do you want to create a student (1) or a  teacher (2)? [Input the number]:'
    selector_person = gets.chomp.to_i
    case selector_person
    when 1
      create_student
    when 2
      create_teacher
    end
    run
  end

  def create_book
    print 'Title:'
    title = gets.chomp
    print 'Author:'
    author = gets.chomp
    @books << Book.new(title, author)
    run
  end

  def create_rental
    puts 'Select a book from the following list by number'
    (0..@books.length - 1).each do |i|
      puts "#{i}) Title: '#{@books[i].title}', Author #{@books[i].author}"
    end
    book = gets.chomp.to_i
    book = @books[book]
    puts 'Select a person from the following list by number (not ID)'
    (0..@people.length - 1).each do |i|
      puts "#{i}) [#{@people[i].class}] Name:'#{@people[i].name}', ID:#{@people[i].id}, Age:#{@people[i].age}"
    end
    person = gets.chomp.to_i
    person = @people[person]
    print 'Date: '
    date = gets.chomp
    Rental.new(date, book, person)
    puts 'Rental created successfully'
    run
  end

  def display_rentals_by_id
    print 'ID of person:'
    id = gets.chomp.to_i
    (0..@people.length - 1).each do |i|
      next unless id == @people[i].id

      person = @people[i].rentals
      puts 'Rentals:'
      (0..person.length - 1).each do |j|
        puts "Date: #{person[j].date}, Book: '#{person[j].book.title}' by #{person[j].book.author}"
      end
    end
    run
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
      list_books
    when 2
      list_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      display_rentals_by_id
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
