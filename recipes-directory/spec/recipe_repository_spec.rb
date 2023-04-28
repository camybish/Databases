require 'recipe_repository'

RSpec.describe RecipeRepository do
    
    def reset_recipe_table
        seed_sql = File.read('./spec/seeds_recipe_test.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'recipe_repository_test' })
        connection.exec(seed_sql)
    end

    before(:each) do 
        reset_recipe_table
    end

    it 'returns the list of recipes' do
        repo = RecipeRepository.new
        recipes = repo.all
        
        expect(recipes.length).to eq 2
        
        expect(recipes.first.id).to eq "1"
        expect(recipes.first.name).to eq 'Pizza'
        expect(recipes.first.mins).to eq '300'
        expect(recipes.first.stars).to eq '5'
    end

    it 'returns a single recipe - Pizza' do 
        repo = RecipeRepository.new

        recipe = repo.find(1)
        
        expect(recipe.id).to eq '1'
        expect(recipe.name).to eq 'Pizza'
        expect(recipe.mins).to eq '300'
        expect(recipe.stars).to eq '5'
    end

    it 'returns a single recipe - Gnocchi' do 
        repo = RecipeRepository.new
        recipe = repo.find(2)

        expect(recipe.id).to eq '2'
        expect(recipe.name).to eq('Gnocchi')
        expect(recipe.mins).to eq('30')
        expect(recipe.stars).to eq('2')
    end
end