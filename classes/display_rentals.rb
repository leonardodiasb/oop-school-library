class DisplayRentals
  def display_rentals_by_id(people)
    print 'ID of person:'
    id = gets.chomp.to_i
    (0..people.length - 1).each do |i|
      next unless id == people[i].id

      person = people[i].rentals
      puts 'Rentals:'
      (0..person.length - 1).each do |j|
        puts "Date: #{person[j].date}, Book: '#{person[j].book.title}' by #{person[j].book.author}"
      end
    end
  end
end
