require_relative 'lib/database_connection'
require_relative 'lib/artist_repository'
require_relative 'lib/album_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('music_library_test')

# Perform a SQL query on the database and get the result set.
artist_repository = ArtistRepository.new
album_repository = AlbumRepository.new

# artist_repository.find(1)


album_repository.all.each do |artist|
  puts "#{artist.id} - #{artist.title} - #{artist.release_year}"
end
