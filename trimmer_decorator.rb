require_relative 'decorator'

# class TrimmerDecorator
class TrimmerDecorator < Decorator
  def correct_name
    super.correct_name.strip
  end
end
