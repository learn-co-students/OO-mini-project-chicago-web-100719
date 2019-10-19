class Recipe
    attr_reader :name, 
    @@all = []

    def initialize (name)
        @name = name
        self.class.all << self
    end 

    def self.all
        @@all
    end

    def self.most_populars
        Recipe.all.max_by do |recipe|
            RecipeCard.all.select do |recipecard| 
                recipecard.recipe == recipe
            end.count
        end
    end 

    def users
        recipecards_recipe = RecipeCard.all.select {|recipecard| recipecard.recipe == self}
        recipecards_recipe.collect {|recipecard| recipecard.user}
    end

    def ingredients
        rec_ing = RecipeIngredient.all.select {|a| a.recipe == self}
        rec_ing.map {|recipe| recipe.ingredient}
    end 

    def allergens
        allegens = Allergy.all.collect { |allergy| allergy.ingredient}
        allegens.select { |ingredient| self.ingredients.include?(ingredient)}
    end 

    def add_ingredients(array_ing)
        array_ing.each { |ingredient| RecipeIngredient.new(ingredient,self)}
    end 
    
end 