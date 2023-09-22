require_relative 'nameable'
class Person < NameAble
  attr_accessor :name, :parent_permission, :age, :classroom,:rentals
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals=[]
    super()
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def add_rental(rental)
    @rental=rental
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end
end
