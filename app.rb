# frozen_string_literal: true

require_relative './book'
require_relative './student'
require_relative './teacher'
require_relative './rental'
require_relative './person'

# App class contains all the methods use by the interface
class App
  attr_reader :books, :people

  def initialize
    @students = []
    @teachers = []
    @people = []
    @books = []
    @rentals = []
  end

  def list_books
    @books.map { |book| p "Title: #{book.title}, Author: #{book.author}" }
  end

  def list_books_with_index
    @books.map.with_index { |book, index| p "#{index}) Title: #{book.title}, Author: #{book.author}" }
  end

  def display_people
    @people.map do |person, _index|
      role = person.is_a?(Student) ? 'Student' : 'Teacher'
      puts " [#{role}] Name: #{person.name}, ID: #{person.id}, Age #{person.age}"
    end
  end

  def create_people(role, age, name, parent_permission, specialization)
    case role
    when 'student'
      student = Student.new(age, name, parent_permission)
      @students.push(student)
      @people.push(student)

    when 'teacher'
      teacher = Teacher.new(age, name, nil, specialization)
      @teachers.push(teacher)
      @people.push(teacher)
    end
  end

  def create_book(title, author)
    new_book = Book.new(title, author)
    @books.push(new_book)
  end

  def list_people
    @people.map.with_index do |person, index|
      role = person.is_a?(Student) ? 'Student' : 'Teacher'
      puts "#{index}) [#{role}] Name: #{person.name}, ID: #{person.id}, Age #{person.age}"
    end
  end

  def create_rental(date, person, book)
    rental = Rental.new(date, person, book)
    @rentals.push(rental)
  end

  def create_rentals(_rental)
    rentals.each { |rental| puts "Date: #{rental.date}, Book: #{rental.book.title}, by #{rental.book.author}" }
  end

  def list_rentals(rental)
    rental.each { |_rentals| puts "Date: #{rental.date}, Book: #{rental.book.title}, by #{rental.book.author}" }
  end
end
