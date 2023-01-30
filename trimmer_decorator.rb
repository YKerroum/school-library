require_relative 'decorator'

# class TrimmerDecorator
class TrimmerDecorator < Decorator
  def correct_name
    super.correct_name.length > 10 ? super.correct_name[0..9] : super.correct_name
  end
end
