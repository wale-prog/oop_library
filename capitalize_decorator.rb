# frozen_string_literal: true

require_relative './decorator'

# Implement the capitalize decorator class
class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end
