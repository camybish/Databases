require_relative 'album'
require_relative 'database_connection'

class AlbumRepository
    def all
        connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
        sql = 'SELECT id, title, release_year, artist_id FROM albums;'
        result_set = connection.exec_params(sql, [])

        albums = []

        result_set.each do |record|
            album = Album.new
            
            album.id = record['id']
            album.title = record['title']
            album.release_year = record['release_year']
            album.artist_id = record['artist_id']
            albums << album
        end
        return albums
    end
end
