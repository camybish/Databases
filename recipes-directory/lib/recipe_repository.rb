require_relative 'recipe'

class RecipeRepository

    # Selecting all records
    # No arguments
    def all

      sql = 'SELECT id, name, mins, stars FROM recipes;'
      result_set = DatabaseConnection.exec_params(sql, [])

      recipes_list = []

      result_set.each do |record|
          recipe = Recipe.new

          recipe.id = record['id']
          recipe.name = record['name']
          recipe.mins = record['mins']
          recipe.stars = record['stars']

          recipes_list << recipe
      end

      return recipes_list
    end
  
    # Gets a single record by its ID
    # One argument: the id (number)
    def find(id)
      sql = 'SELECT id, name, mins, stars FROM recipes WHERE id = $1;'
      sql_params = [id]

      result_set = DatabaseConnection.exec_params(sql, sql_params)

        record = result_set[0]

        recipe = Recipe.new
        recipe.id = record['id']
        recipe.name = record['name']
        recipe.mins = record['mins']
        recipe.stars = record['stars']

        return recipe
    end
  
  end