require_relative 'student'
require_relative 'book'
require_relative 'rental'
require_relative 'teacher'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    @books.each_with_index do |book, index|
      print "#{index}) Title: '#{book.title}', Author: #{book.author}"
    end
  end

  def list_people(with_number: false)
    @people.each_with_index do |person, index|
      print "#{index}) " if with_number
      print "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def add_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    @people << Teacher.new(age, specialization, name)
  end

  def add_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp
    parent_permission = parent_permission.downcase == 'y'
    @people << Student.new(age, name, parent_permission: parent_permission)
  end

  def add_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books << Book.new(title, author)
  end

  def add_rental
    print 'Select a book from the following list by number'
    list_books
    book_number = gets.chomp
    book = @books[book_number]
    print 'Select a person from the following list by number (not id)'
    list_people(true)
    person_number = gets.chomp
    print 'Date: '
    date = gets.chomp
    book.add_rentals(date, people[person_number])
  end

  def list_rentals_for_person_id
    print 'ID of person: '
    id = gets.chomp
    person = @people.filter { |pers| pers.id == id }
    puts 'Rentals:'
    person.rentals.each do |rental|
      puts "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}"
    end
  end
end
