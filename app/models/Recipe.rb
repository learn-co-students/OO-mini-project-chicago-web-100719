class Recipe
attr_accessor :name
@@all = []
def initialize
    @name = ""
    @@all << self
end

def self.all
    @@all
end

def all_cards
    RecipeCard.all.select {|x| x.recipe ==self}
end

def users
    all_cards.collect {|x| x.user}
end


def add_ingredients(ingredients_array)
    ingredients_array.each {|x| RecipeIngredient.new(x, self)}
    
end
def ingredients
    array = RecipeIngredient.all.select {|x| x.recipe == self}
    array.collect {|x| x.ingredient}
end

def self.most_popular
    Recipe.all.max {|x, y| x.all_cards.length <=> y.all_cards.length}
    
end

def allergens
    array = Allergy.all.select {|x| self.ingredients.include?(x.ingredient)}
    array.collect {|x| x.ingredient}
end


end
