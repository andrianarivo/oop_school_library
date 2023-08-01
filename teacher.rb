require_relative 'person'
require 'json'

class Teacher < Person
  attr_reader :specialization

  def initialize(age, specialization, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_s
    "[Teacher] Name: #{@name}, ID: #{@id}, Age: #{@age}"
  end

  def to_json(*args)
    JSON.generate(
      {
        id: @id,
        name: @name,
        age: @age,
        parent_permission: @parent_permission,
        specialization: @specialization
      })
  end

end
