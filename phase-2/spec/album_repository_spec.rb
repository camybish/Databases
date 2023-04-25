require 'album_repository'
require 'pg'

RSpec.describe AlbumRepository do 

    def reset_albums_table
        seed_sql = File.read('spec/seeds_albums.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
        connection.exec(seed_sql)
    end

    before(:all) do 
        reset_albums_table
    end

    it 'returns two albums' do 
        repo = AlbumRepository.new

        albums = repo.all

        expect(albums.length).to eq(2)
        expect(albums.first.title).to eq('Guillotine')
        expect(albums.first.release_year).to eq('2013')
        expect(albums.first.artist_id).to eq('1')
    end
end