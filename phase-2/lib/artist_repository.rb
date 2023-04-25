require_relative 'artist'
require_relative 'database_connection'

class ArtistRepository
    def all
        connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
        sql = 'SELECT id, name, genre FROM artists;'
        result_set = connection.exec_params(sql, [])

        artists = []

        result_set.each do |record|
            artist = Artist.new
            artist.id = record['id']
            artist.name = record['name']
            artist.genre = record['genre']

            artists << artist
        end

        return artists 
    end
end