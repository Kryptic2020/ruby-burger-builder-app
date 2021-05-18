require_relative './menu.rb'
#require_relative './order.rb'

class Burger
  attr_reader :name, :menu
  def initialize(name, ingredient)
    @name = name
    @menu = Menu.new
    populate_menu(ingredient)
  end

  def print_ingredients
    @menu.display_ingredients
  end

  def populate_menu(ingredient)
    ingredient.each do |name, price|
      @menu.add_ingredient(name, price)
    end
  end   

  

end
