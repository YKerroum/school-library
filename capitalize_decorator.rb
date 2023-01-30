require_relative 'decorator'

# class of CapitalizeDecorator
class CapitalizeDecorator < Decorator
  def correct_name
    super.correct_name.capitalize
  end
end
