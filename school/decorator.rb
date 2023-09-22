require_relative 'nameable'
class Decorator < NameAble
  def initialize nameable
    @nameable=nameable
  end
  def correct_name
    @nameable.correct_name
  end
end