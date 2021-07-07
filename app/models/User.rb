class User
    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def add_recipe_card(date, rating, recipe)
        RecipeCard.new(date, rating, self, recipe)
    end

    def declare_allergy(ingredient)
        Allergy.new(ingredient, self)
    end

    def self.all
        @@all
    end

    def recipe_cards
        RecipeCard.all.select{|rc| rc.user == self}
    end

    def recipes
        self.recipe_cards.map{|rc| rc.recipe}
    end

    def allergens
        Allergy.all.select{|a| a.user == self}.map{|a| a.ingredient}
    end

    def top_three_recipes
        self.recipe_cards.sort{|a,b| b.rating <=> a.rating}[0..2]
    end

    def most_recent_recipe
        self.recipes.last
    end

    def safe_recipes
        Recipe.all.select{|r| !r.ingredients.any?{|ingredient| allergens.include?(ingredient)}}
    end
end