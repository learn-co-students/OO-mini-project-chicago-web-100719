class Recipe
    attr_reader :name, :ingredients
    @@all = []

    def initialize (name)
        @name = name
        # @ingredients = ingredients
        self.class.all << self
    end 

    def self.all
        @@all
    end

    def self.most_populars
        RecipeCard.all.max_by {|recipecard| recipecard.count}.recipe
    end 

    def users
        recipecards_recipe = RecipeCard.all.select {|recipecard| recipecard.recipe == self}
        recipecards_recipe.collect {|recipecard| recipecard.user}
    end

    def ingredients
        RecipeIngredient.all.select {|a| a.recipe == self}
    end 

    def allergens
        allegens_ingredient = Allergy.all.collect { |allergy| allergy.ingredient}
        allegens_ingredient.select { |ingredient| self.ingredients.include?(ingredient)}
    end 

    def add_ingredients(array_ing)
        array_ing.each { |ingredient| RecipeIngredient.new(ingredient,self)}
    end 
    
end 