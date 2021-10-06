require './corrector'

class Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @corrector = Corrector.new
  end

  attr_reader :id
  attr_accessor :name, :age

  def of_age?
    @age >= 18
  end

  private :of_age?

  def can_use_services?
    return true if of_age? || @parent_permission
  end

  def validate_name
    @name = @corrector.correct_name(@name)
  end
end
