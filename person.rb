# frozen_string_literal: true

# Person class is super for both teacher and student classes
class Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_reader :id
  attr_accessor :age, :name

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
