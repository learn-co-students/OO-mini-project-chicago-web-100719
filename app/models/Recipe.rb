class Recipe
    attr_reader :name

    @@all = []
    def initialize(name)
        @name = name 
        @@all << self
    end

    def self.all
        @@all
    end

    def add_ingredients(ingredients)
        ingredients.each do |ingredient|
            RecipeIngredient.new(ingredient, self)
        end
    end

    def users
        cards = RecipeCard.all.select do |card|
            card.recipe == self
        end
        cards.collect do |card|
            card.user 
        end
    end

    def recipe_ingredients
        RecipeIngredient.all.select do |ri|
            ri.recipe == self
        end
    end


    def ingredients
    #    recipe_ingredients = RecipeIngredient.all.select do |ri|
    #         ri.recipe == self
    #     end
        self.recipe_ingredients.collect do |ri|
            ri.ingredient 
        end
    end

    def self.most_popular
    #    recipes = RecipeCard.all.collect do |rc|
    #         rc.recipe 
    #     end
    #     recipes.
        self.all.max do |a, b|
            a.users.count <=> b.users.count 
        end
    end

    def allergens
        all_allergens = Allergy.all.collect do |a|
            a.ingredient
        end
        all_allergens.select do |i|
            self.ingredients.include?(i)
        end
    end

end