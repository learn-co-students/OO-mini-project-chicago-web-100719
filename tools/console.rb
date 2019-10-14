require_relative '../config/environment.rb'


janae = User.new("Janae")
sean = User.new("Sean")

taters = Recipe.new("Mashed Potatoes")
jumbalaya = Recipe.new("Jumbalaya")
pumpkin_pie = Recipe.new("Pumpkin Pie")
jello = Recipe.new("Jell-O")
tacos = Recipe.new("Tacos")

potatoes = Ingredient.new("Potatoes")
butter = Ingredient.new("Butter")
milk = Ingredient.new("Milk")


taters.add_ingredients([potatoes, butter, milk])

janae.declare_allergy(butter)
sean.declare_allergy(potatoes)
janae.declare_allergy(potatoes)


one = janae.add_recipe_card(2014, 3, taters)
two = janae.add_recipe_card(2012, 5, jumbalaya)
three = janae.add_recipe_card(2000, 6, pumpkin_pie)
four = janae.add_recipe_card(1999, 2, jello)
five = janae.add_recipe_card(2019, 7, tacos)

binding.pry
