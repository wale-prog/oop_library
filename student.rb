# frozen_string_literal: true

require_relative './person'

# Student class create the students object
class Student < Person
  attr_accessor :classroom

  def initialize(age, name, parent_permission, classroom = nil)
    super(age, name, parent_permission: parent_permission)
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
