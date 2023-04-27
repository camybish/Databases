require 'artist_repository'

RSpec.describe ArtistRepository do
    
    def reset_artists_table
        seed_sql = File.read('./spec/seeds.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory' })
        connection.exec(seed_sql)
    end

    before(:each) do 
        reset_artists_table
    end

    it 'returns the list of recipes' do
        repo = RecipeRepository.new
        recipe = repo.all
        
        expect(recipe.length).to eq 2 # =>  2
        
        expect(recipe.first.id).to eq 1 # =>  1
        expect(recipe.first.mins).to eq 'David' # =>  'David'
        expect(recipe.first.stars).to eq 'April' # =>  'April 2022'
    end

    it 'returns a single recipe - Pizza' do 
        repo = RecipesRepository.new

        recipe = repo.find(2)
        
        recipe[1].id # =>  1
        recipe[1].mins # =>  'David'
        recipe[1].stars # =>  'April 2022'
    end

    it 'returns a single recipe - Kaytranada' do 
        repo = ArtistRepository.new
        recipe = repo.find(2)

        expect(recipe.name).to eq('Kaytranada')
        expect(recipe.genre).to eq('House')
    end
end