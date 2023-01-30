require_relative 'nameable'

# Base Decorator
class Decorator < Numeable
  def initialize(nameable)
    super
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end
