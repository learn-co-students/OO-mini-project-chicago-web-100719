require_relative '../config/environment.rb'
require "date"
recipe_1 = Recipe.new
recipe_2 = Recipe.new
recipe_3 = Recipe.new
recipe_4 = Recipe.new
recipe_5 = Recipe.new

sam = User.new
ted = User.new
sally = User.new
mary = User.new

mary.add_recipe_card(recipe_2, Date.today, 3)
ted.add_recipe_card(recipe_1, Date.today, 5)
mary.add_recipe_card(recipe_3, Date.today, 2)
mary.add_recipe_card(recipe_5, Date.today, 4)
sam.add_recipe_card(recipe_1, Date.today, 3)
ted.add_recipe_card(recipe_3, Date.today, 4)
mary.add_recipe_card(recipe_1, Date.today, 5)

onion = Ingredient.new("onion")
tomato = Ingredient.new("tomato")
garlic = Ingredient.new("garlic")
meat = Ingredient.new("meat")
milk = Ingredient.new("milk")
chocolate = Ingredient.new("chocolate")
apple = Ingredient.new("apple")
flour = Ingredient.new("flour")
butter = Ingredient.new("butter")
cinnamon = Ingredient.new("cinnamon")

ingredients_1 = [onion, tomato, garlic, meat]

recipe_1.add_ingredients(ingredients_1)

sam.declare_allergy(onion)
ted.declare_allergy(tomato)
ted.declare_allergy(garlic)
mary.declare_allergy(onion)
ted.declare_allergy(chocolate)

recipe_1.name = "sauce"
recipe_2.name = "apple pie"
recipe_3.name = "chocolate milk"
recipe_4.name = "gross"

recipe_2.add_ingredients([apple, flour, butter, cinnamon])
recipe_3.add_ingredients([chocolate, milk])
recipe_4.add_ingredients([tomato, garlic, chocolate, onion])

# RecipeIngredient.new(onion, recipe_1)
# RecipeIngredient.new(tomato, recipe_1)
# RecipeIngredient.new(meat, recipe_1)



binding.pry
puts "end"