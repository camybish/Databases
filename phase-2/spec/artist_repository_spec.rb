require 'artist_repository'

RSpec.describe ArtistRepository do
    
    def reset_artists_table
        seed_sql = File.read('./spec/seeds_artists.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
        connection.exec(seed_sql)
    end

    before(:each) do 
        reset_artists_table
    end

    it 'returns the list of artists' do
        repo = ArtistRepository.new

        artists = repo.all

        expect(artists.length).to eq(2) 
        expect(artists.first.id).to eq('1')
        expect(artists.first.name).to eq('Death Grips')
    end

    it 'returns a single artist - Death Grips' do 
        repo = ArtistRepository.new
        artist = repo.find(1)

        expect(artist.name).to eq("Death Grips")
        expect(artist.genre).to eq("Alt Rap")
    end

    it 'returns a single artist - Kaytranada' do 
        repo = ArtistRepository.new
        artist = repo.find(2)

        expect(artist.name).to eq('Kaytranada')
        expect(artist.genre).to eq('House')
    end
end