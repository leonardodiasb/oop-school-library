require_relative './corrector'
require_relative './rental'

class Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @age = age
    @corrector = Corrector.new
    @name = validate_name(name)
    @parent_permission = parent_permission
    @rentals = []
  end

  attr_reader :id, :rentals
  attr_accessor :name, :age

  def of_age?
    @age >= 18
  end

  private :of_age?

  def can_use_services?
    return true if of_age? || @parent_permission
  end

  def validate_name(name)
    @corrector.correct_name(name)
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end
end
