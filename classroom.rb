require 'json'

class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    student.classroom = self
    @students.push(student)
  end

  def to_json(*_args)
    JSON.generate(
      {
        label: @label
      }
    )
  end
end
