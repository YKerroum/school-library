# Class: Person
class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def is_of_age? # rubocop:disable Naming/PredicateName
    @age >= 18
  end

  def can_use_services?
    is_of_age? || @parent_permission
  end
end