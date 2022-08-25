# frozen_string_literal: true

require_relative './nameable'
require_relative './decorator'

# Person class is super for both teacher and student classes
class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rental(book, date)
    Rental.new(date, self, book)
  end

  attr_reader :id
  attr_accessor :age, :name

  def correct_name
    @name
  end

  def of_age?
    @age >= 18
  end
  private :of_age?

  def can_use_service?
    if of_age? || @parent_permission
      true
    else
      false
    end
  end
end

# TO TEST ALL CLASSES IN ONE FILE
# class TrimmerDecorator < Decorator
#   def correct_name
#     @nameable.correct_name.slice(0..9)
#   end
# end

# class CapitalizeDecorator < Decorator
#   def correct_name
#     @nameable.correct_name.capitalize
#   end
# end

# person = Person.new(22, 'maximilianus')
# capitalizedPerson = CapitalizeDecorator.new(person)
# p capitalizedPerson.correct_name
# trimmer = TrimmerDecorator.new(capitalizedPerson)
# p trimmer.correct_name
