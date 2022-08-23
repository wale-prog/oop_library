# frozen_string_literal: true

require './person'

# Student class create the students object
class Student < Person
  def initialize(classroom, age, name = 'Unknown')
    super(age, name)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end

wale = Student.new('Physics', 20, 'John')
p wale.can_use_service?
