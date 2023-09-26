require_relative 'school/app'

class Main
  attr_reader :app
  def initialize
    @app = App.new
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

  def case_method(user_input)
    case user_input
    when 1
      @app.list_books
    when 2
      @app.list_people
    when 3
      @app.create_person
    when 4
      @app.add_book
    when 5
      @app.create_rental
    when 6
      @app.list_rentals
    when 7
      puts "Thank you for using our application"
    else
      puts 'invalid input!'
    end
  end
end

main = Main.new
main.start
