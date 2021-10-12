require_relative './student'
require_relative './teacher'

class CreatePerson
  def create_student(people)
    print 'Age:'
    age = gets.chomp.to_i
    print 'Name:'
    name = gets.chomp
    print 'Has parent permission? [Y/N]:'
    parent_permission = gets.chomp
    people << Student.new(age, name, parent_permission)
  end

  def create_teacher(people)
    print 'Age:'
    age = gets.chomp.to_i
    print 'Name:'
    name = gets.chomp
    print 'Specialization:'
    specialization = gets.chomp
    people << Teacher.new(age, name, specialization)
  end

  def create_person(people)
    puts 'Do you want to create a student (1) or a  teacher (2)? [Input the number]:'
    selector_person = gets.chomp.to_i
    case selector_person
    when 1
      create_student(people)
    when 2
      create_teacher(people)
    end
  end
end
