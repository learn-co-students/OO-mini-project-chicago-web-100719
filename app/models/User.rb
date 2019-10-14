class User
    @@all = []
    def initialize
        @@all << self
    end
    
    def self.all
        @@all
    end



    def add_recipe_card(recipe, date, rating)
    RecipeCard.new(self, recipe, date, rating)
    end

    def declare_allergy(ingredient)
        Allergy.new(ingredient, self)
    end
def allergens
    allergy_array = Allergy.all.select {|x| x.user == self}
    allergy_array.collect {|x| x.ingredient}
end
    
def recipes
    RecipeCard.all.select {|x| x.user == self}
    end
def top_three_recipes
    recipes.max(3) {|a,b| a.rating <=> b.rating}
end

def most_recent_recipe
    recipes[-1]
end

end