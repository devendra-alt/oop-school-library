class Person
  attr_accessor :id, :name, :parent_permission, :age

  def initialize(age, name: 'Unknown', parent_permission: true)
    @name = name
    @age = age
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
