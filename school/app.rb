require_relative 'classroom'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
class App
  def initialize
    @books = []
    @people = []
    @rentals = []
    @classroom = ClassRoom.new('my-classroom')
  end

  def list_books
    if @book.empty?
      puts 'book list is empty'
      return
    end
    @books.each_with_index do |book, index|
      puts "#{index} Title : #{book.title}, Author : #{book.author}"
    end
  end

  def list_people
    if @people.empty?
      puts 'people list is empty'
      return
    end
    @people.each_with_index do |person, index|
      puts "#{index} [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
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
      @people << Student.new(age, @classroom, permission, name)
      puts 'Student created succefully'
    else
      print 'Specialization: '
      specialization = gets.chomp.strip
      @people << Teacher.new(age, specialization, name)
      puts 'Teacher created succefully'
    end
  end

  def add_book
    print 'Title: '
    title = gets.chomp.strip
    print 'Author: '
    author = gets.chomp.strip
    @books << Book.new(title, author)
    puts 'Added book succesfully'
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
    @rentals << person.add_rental(date, book)
    puts 'Created rental successfully'
  end

  def find_person_by_id(id)
    @people.find do |person|
      person.id == id
    end
  end

  def list_rentals
    print 'ID of person : '
    id = gets.chomp.to_i
    if find_person_by_id(id).nil?
      puts 'No person data found!'
      return
    end
    rental_answer = @rentals.find do |rental|
      rental.person == choose_person
    end
    if rental_answer.nil?
      puts 'No rental data found'
      return
    end
    puts 'Rentals: '
    puts "Date : #{rental_answer.date}, Book : #{rental_answer.book.title}, by #{rental_answer.book.author}"
  end
end
