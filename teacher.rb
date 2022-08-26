# frozen_string_literal: true

require_relative './person'
# Teacher class create the teachers object
class Teacher < Person
  def initialize(age, name, parent_permission, specialization)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_service
    true
  end
end
