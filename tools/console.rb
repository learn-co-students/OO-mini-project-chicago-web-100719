require_relative '../config/environment.rb'
john = User.new("John")
daniel = User.new("Daniel")
recipecard = RecipeCard.new("Daniel", "applepie")
recipecard2 = RecipeCard.new("Daniel", "mashed_potatoes")
daniels_allergy = Allergy.new("Daniel", "apple")
apple = Ingredient.new("apple")
potatoe = Ingredient.new("potatoe")
applepie_recipe = Recipe.new("applepie")
mashed_potatoes = Recipe.new("mashed_potatoes")
recipe_ing = RecipeIngredient.new("apple", "applepie")
recipe_ing2 = RecipeIngredient.new("potatoe", "mashed_potatoes")

binding.pry
