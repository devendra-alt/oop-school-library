class Rental
  attr_accessor :date, :book
  def initialize (date,book,person)
    @date=date
    @book=book
    @person=person
  end
  def date
    @date
  end
  def date=(date)
    @date=date
  end
end