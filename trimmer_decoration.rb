# frozen_string_literal: true

require_relative './decorator'
# Implement the Trimmer decorator class
class TrimmerDecorator < Decorator
  def correct_name
    @nameable.correct_name.slice(0..9)
  end
end
