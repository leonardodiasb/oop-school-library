require_relative './rental'

class CreateRental
  def create_rental(books, people)
    puts 'Select a book from the following list by number'
    (0..books.length - 1).each do |i|
      puts "#{i}) Title: '#{books[i].title}', Author #{books[i].author}"
    end
    book = gets.chomp.to_i
    book = books[book]
    puts 'Select a person from the following list by number (not ID)'
    (0..people.length - 1).each do |i|
      puts "#{i}) [#{people[i].class}] Name:'#{people[i].name}', ID:#{people[i].id}, Age:#{people[i].age}"
    end
    person = gets.chomp.to_i
    person = people[person]
    print 'Date: '
    date = gets.chomp
    Rental.new(date, book, person)
    puts 'Rental created successfully'
  end
end
