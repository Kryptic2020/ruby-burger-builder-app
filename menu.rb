require_relative './ingredient.rb'
class Menu
  
  def initialize
    @ingredients = []
  end

  def add_ingredient(name, price)
    ingredient = Ingredient.new(name, price)
    @ingredients << ingredient
  end

end