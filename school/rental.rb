class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    book.rentals << self
    @book = book
    person.rentals << self
    @person = person
  end
end
