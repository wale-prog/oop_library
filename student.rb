# frozen_string_literal: true

require_relative './person'

# Student class create the students object
class Student < Person
  attr_accessor :classroom

  def initialize(classroom, age, name = 'Unknown')
    super(age, name)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def add_classroom(classroom)
    @classroom = classroom
    @classroom.students.push(self) unless classroom.students.include?(self)
  end

end

john = Student.new('Physics', 20, 'John')
p john.add_classroom()
