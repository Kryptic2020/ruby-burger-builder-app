require_relative './menu.rb'
require_relative './order.rb'

class Burger
  attr_reader :name, :menu,:order
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
      @menu.add_ingredient(name, price.to_f)
    end
  end 

  def add_to_order(ingredient, quantity)
    @order.add_ingredient(ingredient, quantity)
  end 

  def display_order
    @order.display
  end 

  def display_order_total_amount
  total = 0
    @order.get_ingredients.each do |name, quantity|    
      total += @menu.get_price(name) * quantity
    end
    print TTY::Box.frame " Custom Burger Order Price ... $ #{total.round(2)} ".light_yellow.on_blue
    puts
    
  end

  

end
