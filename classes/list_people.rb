class ListPeople
  def list_people(people)
    (0..people.length - 1).each do |i|
      puts "[#{people[i].class}] Name:'#{people[i].name}', ID:#{people[i].id}, Age:#{people[i].age}"
    end
  end
end
