require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def classroom=(classroom)
    classroom.students.push(self) unless classroom.students.include?(self)
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end

  def to_s
    "[Student] Name: #{@name}, ID: #{@id}, Age: #{@age}"
  end
end
