require_relative 'app'
require_relative 'teacher'
require_relative 'student'
require_relative 'book'
require_relative 'rental'

def show_options
  puts "Please choose an option by entering a number"
  puts "1 - List all books"
  puts "2 - List all people"
  puts "3 - Create a person"
  puts "4 - Create a book"
  puts "5 - Create a rental"
  puts "6 - List all rentals for a given person id"
  puts "7 - Exit"
end

loop = true

while loop
  show_options
  res = gets.chomp.to_i
  case res
  when 1
    puts "\n#####################"
    puts "**      BOOKS      **"
    puts "#####################\n\n"
    list_books
  when 2
    puts "\n#####################"
    puts "**     PEOPLE      **"
    puts "#####################\n\n"
    list_people
  when 3
    puts 'Do you want to create a Student (1) or a Teacher (2)? [Input the number]'
    choice = gets.chomp.to_i
    print "Age: "
    age = gets.chomp.to_i
    print "Name: "
    name = gets.chomp
    if choice == 1
      print "Has parent permission? [Y/n]: "
      parent_permission = gets.chomp.downcase == "y"
      person = Student.new(age, name, parent_permission)
    else
      print "Specialization: "
      specialization = gets.chomp
      person = Teacher.new(age, name, specialization)
    end
    create_person(person)
    puts "Person created successfully"
  when 4
    print "Title: "
    title = gets.chomp
    print "Author: "
    author = gets.chomp
    book = Book.new(title, author)
    create_book(book)
    puts "Book created successfully"
  when 5
    puts "Select a book from the following list by number"
    list_books
    choice_book = gets.chomp.to_i
    choice_book -= 1
    puts "Select a person from the following list by number (not id)"
    list_people
    choice_person = gets.chomp.to_i
    choice_person -= 1
    print 'Date: '
    date_str = gets.chomp
    date_format = "%Y/%m/%d"
    date = Date.strptime(date_str, date_format)
    book = $books[choice_book]
    person = $people[choice_person]
    rental = Rental.new(date, book, person)
    create_rental(rental)
    puts "Rental created successfully"
  when 6
    print "ID of person: "
    person_id = gets.chomp.to_i
    puts "\n#####################"
    puts "**     RENTALS     **"
    puts "#####################\n\n"
    list_rentals(person_id)
  when 7
    loop = false
  else
    puts "Please type between 1 to 7"
  end
end