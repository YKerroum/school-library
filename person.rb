require_relative 'nameable'
require_relative 'rental'
# Class: Person
class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  def is_of_age? # rubocop:disable Naming/PredicateName
    @age >= 18
  end

  def can_use_services?
    is_of_age? || @parent_permission
  end

  def correct_name
    @name
  end
end
