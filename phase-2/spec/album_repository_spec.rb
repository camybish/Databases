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
        expect(albums.first.title).to eq('The Money Store')
        expect(albums.first.release_year).to eq('2012')
        expect(albums.first.artist_id).to eq('1')
    end

    it 'returns the second album - Bottomless Pit' do 
        repo = AlbumRepository.new

        albums = repo.all

        expect(albums[1].title).to eq('Bottomless Pit')
        expect(albums[1].release_year).to eq('2016')
        expect(albums[1].artist_id).to eq('1')

    end

    it 'creates a new album - Bubba' do
        repo = AlbumRepository.new

        album = Album.new
        album.title = 'Bubba'
        album.release_year = '2019'
        album.artist_id = 2

        repo.create(album)

        all_albums = repo.all
        expect(all_albums).to include(
            have_attributes(
                title: 'Bubba',
                release_year: '2019',
                artist_id: '2'
            )
        )
    end

    xit 'updates an album - Bottomless Pit' do 
       repo = AlbumRepository.new
       
       id = 2
       album = repo.find(id)
      
       album.title = 'Bottomless Pit (fav!)'

       repo.update(album, id)

       updated_album = repo.find(2)
       expect(updated_album.title).to eq('Bottomless Pit (fav!)')
    end

    it 'deletes an album - The Money Store' do 
        repository = AlbumRepository.new

        repository.delete(2)
        all_albums = repository.all
        expect(all_albums.length).to eq(1)
    end

end