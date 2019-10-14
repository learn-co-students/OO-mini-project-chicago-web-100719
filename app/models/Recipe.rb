class Recipe
    attr_accessor
    attr_reader :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def ingredients
        recipe_ingredients = RecipeIngredient.all.select {|ri| ri.recipe == self}.map{|ri| ri.ingredient}
    end

    def users
        recipe_cards = RecipeCard.all.select{|rc| rc.recipe == self}.map{|r| r.user}
    end

    def self.most_popular
        Recipe.all.sort{|r,s| s.users.count <=> r.users.count}[0]
    end

    def allergens
        #Should return all of the Ingredients in this recipe that are allergens for Users in our system
        self.ingredients.select do |i|
            Allergy.all.map{|a| a.ingredient}.include?(i)
        end
    end

    def add_ingredients(ingredients)
        ingredients.each{|i| RecipeIngredient.new(self, i)}
    end

end