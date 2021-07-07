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
        hash = {}
        Allergy.all.each do |a|
            if !hash[a.ingredient]
                hash[a.ingredient] = 1
            else
                hash[a.ingredient] += 1
            end
        end
        hash.max_by{|k,v| v}[0]
    end
end