require_relative './menu.rb'
require_relative './order.rb'
require_relative './styles.rb'
require 'artii'

class Burger
  attr_reader :name, :menu,:order
  def initialize(name, ingredient)
    @name = name
    @menu = Menu.new
    @order = Order.new
    populate_menu(ingredient)
  end

  #Display Ingredient list
  def print_ingredients
    @menu.display_ingredients
  end

  #Execute add ingredient to menu
  def populate_menu(ingredient)
    ingredient.each do |name, price|
      @menu.add_ingredient(name, price.to_f)
    end
  end 

  #Add ingredient to order
  def add_to_order(ingredient, quantity)
    @order.add_order_ingredient(ingredient, quantity)
  end 

  #Display order
  def display_order
    @order.display
  end 

  #Get order total amount
  def order_total_amount
    total = 0
    @order.get_order_ingredients.each do |name, quantity| 
      total += @menu.get_price(name) * quantity
    end
    return total.to_f
  end

  #Display order total amount
  def display_order_total_amount
    message_info(" Custom Burger Order Price ... $ #{order_total_amount.round(2)} ") 
  end

end
