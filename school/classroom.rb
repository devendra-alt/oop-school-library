class ClassRoom
  attr_accessor :label
  attr_reader :students
  def initialize label
    @label=label
    @students=[]
  end
  def label
    @label
  end
  def label=(label)
    @label=label
  end
  def add_student student
    @student.push(student)
  end
end