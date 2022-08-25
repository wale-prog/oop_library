# frozen_string_literal: true

require_relative './nameable'

# Implement the class decorator class
class Decorator < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end
