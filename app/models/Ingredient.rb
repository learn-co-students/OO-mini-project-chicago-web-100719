class Ingredient
    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.most_common_allergen
       ingredients = Allergy.all.collect do |a|
            a.ingredient 
       end
       ingredient_hash = ingredients.inject(Hash.new(0)) do |h, v|
        h[v] += 1; h
       end

       ingredient_hash.select {|k,v| v == ingredient_hash.values.max }
    end
end