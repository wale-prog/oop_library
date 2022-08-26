# frozen_string_literal: true

require './App'

APP = App.new
# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/CyclomaticComplexity
def menu
  puts "Welcome to School Library App! \n\n"
  puts 'Please choose an option by entering a number:'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
  gets.chomp.to_i
end

def main
  choice = menu
  case choice
  when 1
    list_books
    main
  when 2
    display_people
    main
  when 3
    create_people
    main
  when 4
    create_book
    main
  when 5
    create_rental
    main
  when 6
    list_rentals
    main
  when 7
    puts "Thank you for using this app \n"
    exit
  end
end

def list_books
  APP.list_books
end

def create_people
  puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
  role = gets.chomp.to_i
  puts 'Age: '
  age = gets.chomp.to_i
  puts 'Name: '
  name = gets.chomp
  case role
  when 1
    role = 'student'
    puts 'Parents permission? [Y/N]: '
    parent_permission = gets.chomp.slice(0).capitalize
    case parent_permission
    when 'N'
      parent_permission = false
    when 'Y'
      parent_permission = true
    else
      'Please enter a valid response'
    end
    APP.create_people(role, age, name, parent_permission, nil)
  when 2
    role = 'teacher'
    puts 'Specialization: '
    specialization = gets.chomp
    APP.create_people(role, age, name, nil, specialization)
  else
    puts 'You have not entered a valid choice'
  end
  puts "Person created successfully \n"
end

def display_people
  APP.display_people
end

def create_book
  puts 'Title: '
  title = gets.chomp
  puts 'Author: '
  author = gets.chomp
  APP.create_book(title, author)
  puts 'Book created successfully'
end

def create_rental
  puts 'Select a book from the following list by number'
  APP.list_books_with_index
  book = gets.chomp.to_i
  puts 'Select a person from the following list by number(not id)'
  APP.list_people
  person = gets.chomp.to_i
  puts 'Date: '
  date = gets.chomp
  book = APP.books[book]
  person = APP.people[person]
  APP.create_rental(date, person, book)
  puts "Rental created successfully\n"
end

def list_rentals
  puts 'ID of person: '
  id = gets.chomp.to_i
  filtered = APP.people.select { |person| id == person.id }.first

  if filtered.nil?
    puts 'The entry with the given id does not exist'
  else
    rental = filtered.rentals
    APP.list_rentals(rental)
  end
end
main
