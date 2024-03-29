require_relative './artist'

class ArtistRepository
    def all
        sql = 'SELECT id, name, genre FROM artists;'
        result_set = DatabaseConnection.exec_params(sql, [])

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

    #select a single record
    #given the id in argument (a number)
    def find(id)
        # executes the SQL queery(slay):
        sql = 'SELECT id, name, genre FROM artists WHERE id = $1;'
        sql_params = [id]

        result_set = DatabaseConnection.exec_params(sql, sql_params)

        record = result_set[0]

            artist = Artist.new
            artist.id = record['id']
            artist.name = record['name']
            artist.genre = record['genre']

            return artist


        # p result_set
    end

end