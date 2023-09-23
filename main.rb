require_relative 'school/classroom'
require_relative 'school/person'
require_relative 'school/student'
require_relative 'school/teacher'
require_relative 'school/book'
require_relative 'school/capitalize_decorator'
require_relative 'school/trimmer_decorator'

class Main
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def case_method(user_input)
    case user_input
    when 1
      list_books
    when 2
      list_people
    when 3
      create_person
    when 4
      add_book
    when 5
      create_rental
    when 6
      list_rentals
    end
  end

  def start
    user_input = 0
    while user_input != 7
      puts 'Please choose an option by entering a number:'
      puts '1 - List all books'
      puts '2 - List all people'
      puts '3 - Create a person'
      puts '4 - Create a book'
      puts '5 - Create a rental'
      puts '6 - List all rentals for a given person id'
      puts '7 - Exit'
      user_input = gets.chomp.strip.to_i
      case_method(user_input)
    end
  end

  def list_books
    @books.each_with_index do |book, index|
      puts "#{index} Title : #{book.title}, Author : #{book.author}"
    end
  end

  def list_people
    @people.each_with_index do |person, index|
      puts "#{index} [#{person.class}] Name: #{person.name} ID: #{person.id} Age: #{person.age}"
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    user_type = gets.chomp.strip.to_i
    print 'Age: '
    age = gets.chomp.strip.to_i
    print 'Name: '
    name = gets.chomp.strip
    if user_type == 1
      print 'Has parent permission? [Y/N]: '
      permission = gets.chomp.strip.upcase == 'Y'
      @people << Student.new(age, name, permission)
    else
      print 'Specialization: '
      specialization = gets.chomp.strip
      @people << Teacher.new(age, specialization, name)
    end
  end

  def add_book
    print 'Title: '
    title = gets.chomp.strip
    print 'Author: '
    author = gets.chomp.strip
    @books << Book.new(title, author)
  end

  def create_rental
    puts 'Select a book from the following list by number [not id]'
    list_books
    book_choice = gets.chomp.to_i
    book = @books[book_choice]
    puts 'Select a person from the following list by number [not id]'
    list_people
    person_choice = gets.chomp.to_i
    person = @people[person_choice]
    print 'Enter date of booking [yyyy/mm/dd] : '
    date = gets.chomp.strip
    person.add_rental(date, book)
  end

  def list_rentals
    print 'ID of person'
    gets.chomp.to_i
    choose_person = @people.each do |person|
      return person if person.id == id
    end
    puts 'Rentals: '
    p choose_person
    return unless choose_person.length.positive?

    choose_person.rentals.each do |rental|
      puts "Date : #{rental.date}, Book : #{rental.book.title}, by #{rental.book.author}"
    end
  end
end

main = Main.new
main.start
