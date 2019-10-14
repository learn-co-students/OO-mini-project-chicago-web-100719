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
        all_allergens = {}
        Allergy.all.each {|a| 
        if all_allergens.keys.include?(a.ingredient)
            all_allergens[a.ingredient] += 1
        else
        all_allergens[a.ingredient]= 1
        end}
        all_allergens.key(all_allergens.values.max)
    end



end

