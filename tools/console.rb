require_relative '../config/environment.rb'
require 'date'

nik = User.new("Nik")
ben = User.new("Ben")
dan = User.new("Dan")

apple_pie = Recipe.new("apple pie")
beef_stew = Recipe.new("beef stew")
beignet = Recipe.new("beignet")
sweet_beef = Recipe.new("sweet beef")

sugar = Ingredient.new("sugar")
apple = Ingredient.new("apple")
beef = Ingredient.new("beef")
salt = Ingredient.new("salt")
carrot = Ingredient.new("carrot")
flour = Ingredient.new("flour")

apple_pie.add_ingredients([sugar, apple])
beef_stew.add_ingredients([beef, salt, carrot])
beignet.add_ingredients([sugar, flour])
sweet_beef.add_ingredients([sugar, beef])


nik.add_recipe_card(apple_pie, Date.today, 9)
ben.add_recipe_card(apple_pie, Date.today, 5)
ben.add_recipe_card(beef_stew, Date.today, 8)
ben.add_recipe_card(beignet, Date.today, 6)
ben.add_recipe_card(sweet_beef, Date.today, 1)
ben.declare_allergy(sugar)
nik.declare_allergy(carrot)
nik.declare_allergy(sugar)
dan.declare_allergy(sugar)

binding.pry
