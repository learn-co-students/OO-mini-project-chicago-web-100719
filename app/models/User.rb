class User
    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def add_recipe_card(recipe, date, rating)
        RecipeCard.new(self, recipe, date, rating)
    end

    def declare_allergy(ingredient)
        Allergy.new(self, ingredient)
    end

    def allergens
        allergies = Allergy.all.select do |allergy|
            allergy.user == self
        end
        allergies.collect do |allergy|
            allergy.ingredient
        end
    end

    def my_cards
        RecipeCard.all.select do |r|
            r.user == self
        end
    end

    def recipes
        # r_cards = RecipeCard.all.select do |r|
        #     r.user == self
        # end

        my_cards.collect do |r|
            r.recipe
        end
    end

    def top_three_recipes
        top_three = my_cards.max(3) do |a, b|
            a.rating <=> b.rating
        end
        top_three.collect do |a|
            a.recipe
        end
    end
    def most_recent_recipe
        my_cards.last.recipe
    end

    def safe_recipes
        card_recipe = RecipeCard.all.collect do |rc|
            rc.recipe
        end
        card_recipe.reject do |c|
            c.ingredients.any? { |x| self.allergens.include?(x) }
        end
    end
end