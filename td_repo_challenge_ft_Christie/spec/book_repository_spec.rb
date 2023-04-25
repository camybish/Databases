require "book_repository"
require 'pg'


RSpec.describe BookRepository do 
    def reset_books_table
        seed_sql = File.read('lib/seeds.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store' })
        connection.exec(seed_sql)
    end
      
    before(:all) do 
        reset_books_table
    end
      
        # (your tests will go here).

  it 'gets first book details' do
    repo = BookRepository.new

    library = repo.all
    
    expect(library.length).to eq 2
    
    expect(library.first.id).to eq "1"
    expect(library.first.title).to eq "Bible"
    expect(library.first.author_name).to eq "Jesus Christ"
  end 

  it 'gets last book details' do
    repo = BookRepository.new

    library = repo.all

    expect(library.last.id).to eq "2"
    expect(library.last.title).to eq "Koran"
    expect(library.last.author_name).to eq "Prophet Muhammed"
  end 


end 