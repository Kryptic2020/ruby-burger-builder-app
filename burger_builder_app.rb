require_relative './menu.rb'
require_relative './order.rb'

class Burger
  attr_reader :name, :menu
  def initialize(name, ingredient)
    @name = name
    @menu = Menu.new
    @order = Order.new
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

  def add_to_order(ingredient, quantity)
    @order.add_ingredient(ingredient, quantity)
  end 

  def display_order
    @order.display
  end 

  

end
