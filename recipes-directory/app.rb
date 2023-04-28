require_relative 'lib/recipe_repository'
require_relative 'lib/database_connection'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('recipes_directory')

# Perform a SQL query on the database and get the result set.
sql = 'SELECT * FROM recipes;'
result = DatabaseConnection.exec_params(sql, [])

# Print out each record from the result set .
recipe_repository = RecipeRepository.new

recipe_repository.all.each do |recipe|
  puts "#{recipe.id} - #{recipe.name} - #{recipe.mins} mins - #{recipe.stars} stars"
end




=begin
result.each do |record|
  puts record
end
=end