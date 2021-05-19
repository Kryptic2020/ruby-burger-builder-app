require_relative './ingredient.rb'
require "tty-box"
class Menu
  attr_reader :ingredients
  def initialize
    @ingredients = []
  end

  def add_ingredient(name, price)
    ingredient = Ingredient.new(name, price)
    @ingredients << ingredient
  end

  def display_ingredients
    print TTY::Box.frame " *** Ingredient Price List ***  ".light_magenta.on_blue
    @ingredients.each {|item| puts "#{item}".light_magenta.on_blue}
    puts "|________________________________|".light_magenta.on_blue
    puts
    return nil   
  end

  def get_price(name)
    @ingredients.each do |ingredient|
      if ingredient.name == name 
        return ingredient.price.to_f
      end  
    end
  end

end



# menu = Menu.new
# menu.add_ingredient("tomato", 5.00)
# menu.add_ingredient("cheese", 7.50)
# menu.display_ingredients