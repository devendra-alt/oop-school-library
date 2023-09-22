require_relative 'school/person'
require_relative 'school/capitalize_decorator'
require_relative 'school/trimmer_decorator'


def main
  person = Person.new(22, 'maximilianus')
  person.correct_name
  capitalized_person = CapitalizeDecorator.new(person)
  puts capitalized_person.correct_name
  capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
  puts capitalized_trimmed_person.correct_name
end

main()