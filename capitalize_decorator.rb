# frozen_string_literal: true

require './decorator'

# Implement the capitalize decorator class
class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end
