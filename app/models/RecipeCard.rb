require 'date'

class RecipeCard
    
    attr_reader :user, :recipe
    attr_accessor :date, :rating

    @@all = []

    def initialize (user, recipe, date = Date.today, rating = 0)
        @user = user
        @recipe = recipe
        @date = date
        @rating = rating
        @@all << self
    end 

    def self.all 
        @@all
    end
end 