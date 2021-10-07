require './person'

class Student < Person
  def initialize(age, name, classroom: nil)
    super(age, name, parent_permission: true)
    @classroom = classroom
  end

  attr_reader :classroom

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
