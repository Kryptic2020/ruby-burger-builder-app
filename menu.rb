require_relative './ingredient.rb'
require "tty-box"
class Menu
  
  def initialize
    @ingredients = []
  end

  def add_ingredient(name, price)
    ingredient = Ingredient.new(name, price)
    @ingredients << ingredient
  end

  def display_ingredients
    print TTY::Box.frame " *** Ingredient Price List ***  "
    @ingredients.each {|item| puts "#{item}"}
    puts "|________________________________| "
    puts
    return nil
   
  end

end



# menu = Menu.new
# menu.add_ingredient("tomato", 5.00)
# menu.add_ingredient("cheese", 7.50)
# menu.display_ingredients