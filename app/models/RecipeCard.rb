class RecipeCard
    attr_reader :date, :rating, :user, :recipe
    @@all = []

    def initialize (user, recipe, date, rating)
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