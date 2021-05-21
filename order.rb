require_relative './burger_builder_app.rb'
require_relative './styles.rb'
require "tty-table"

class Order
  attr_reader :has_order
  def initialize
    @order_ingredients = Hash.new(0)
    @has_order = false
  end

  #add ingredients to the order
  def add_order_ingredient(name, quantity)
    @has_order = true
     @order_ingredients[name] += quantity
  end

  def get_order_ingredients    
    return @order_ingredients
  end

  def display
    puts
    print message_frame(" Your Custom Burger - Selected Ingredients ") 
    rows = []
    @order_ingredients.each do|k, v| 
      arr = ["     #{k.capitalize}", "   Qtty  #{v}"]
      rows << arr
    end
    table = TTY::Table.new(rows)
    print "#{table.render(:unicode, width: TTY::Screen.width, resize: true)}".light_white.on_light_blue    
    puts   
    return nil
  end  

end