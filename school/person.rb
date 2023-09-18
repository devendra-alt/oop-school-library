class Person
  attr_accessor :name, :parent_permission, :age, :classroom
  attr_reader :id

  def initialize(_classroom, _specialization, age, name: 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @classroom = classroom
    @specialization = specialization
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    return of_age? or @parent_permission
  end
end
