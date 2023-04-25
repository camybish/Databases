require_relative 'books'

class BookRepository
    def all
        connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store_test' })
        sql = "SELECT id, title, author_name FROM books;"
        result_set = connection.exec_params(sql, [])
        
        books = []

        result_set.each do |record|
            book = Books.new

            book.id = record["id"]
            book.title = record["title"]
            book.author_name = record["author_name"]
            books << book 
        # Returns an array of Student objects.
        end

        return books
    end
end
