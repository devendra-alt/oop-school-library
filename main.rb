require_relative 'school/person'
require_relative 'school/capitalize_decorator'
require_relative 'school/trimmer_decorator'

def main 
  user_input=0
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
    case user_input
    when 1
      list_books
    when 2
      list_people
    when 3
      create_person   
    when 4
      add_book   
    end
  end
end

main
