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
        user_rc = RecipeCard.all.select{|rc| 
            rc.user == self}
        user_rc.collect{|rc| recipies.recipe }
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
       user_rc = RecipeCard.all.select {|rc| rc.user == self}
       top_three = user_rc.max(3) {|a,b| a.rating <=> b.rating}
       top_three.collect {|recipecard| recipecard.recipe}
    end

    def most_recent_recipe
        self.recipes.last
    end 
    
end 