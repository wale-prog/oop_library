# frozen_string_literal: true

require_relative './person'
# Teacher class create the teachers object
class Teacher < Person
  def initialize(specialization, age, name = 'Unknown')
    super(age, name)
    @specialization = specialization
  end

  def can_use_service
    true
  end
end

mark = Teacher.new('Math', 35, 'Mark')
p mark
