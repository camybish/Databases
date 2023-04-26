require_relative 'lib/database_connection'
require_relative 'lib/book_repository'

DatabaseConnection.connect('book_store')

# sql = 'SELECT id, title, author_name FROM books;'
# result = DatabaseConnection.exec_params(sql, [])

book_repository = BookRepository.new

=begin
book_repository.all.each do |book|
    p book 
end
=end

# puts "1 - #{book_1.@title} - #{book_1.@author_name}"

book_repository.all.each do |book|
    puts "#{book.id} - #{book.title} - #{book.author_name}"
end