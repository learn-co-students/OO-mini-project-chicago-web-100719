class User
    attr_reader :name
    @@all = []

    def initialize (name)
        @name = name 
        @@all << self
    end 

    def self.all
        @@all
    end 

    def recipes
        user_recipies = RecipeCard.all.select{|recipecard| 
            recipecard.user == self}
        recipies = user_recipies.collect{|recipies|
            recipies.recipe }
        recipes
    end 

    def add_recipe_card(recipe, date, rating)
        RecipeCard.new(self, recipe, date, rating)
    end

    def declare_allergy(ingredient)
        Allergy.new(self, ingredient)
    end

    def allergens
        allergies = Allergy.all.select {|allergy| allergy.user == self}
        allergens.collect {|allergy| allergy.ingredient}
    end

    def top_three_recipes
       user_recipe_cards = RecipeCard.all.select {|recipecard| recipecard.user == self}
       top_three = user_recipe_cards.max(3) {|a,b| a.rating <=> b.rating}
       top_three.collect {|recipecard| recipecard.recipe}
    end

    def most_recent_recipe
        self.recipes.last
    end 
end 