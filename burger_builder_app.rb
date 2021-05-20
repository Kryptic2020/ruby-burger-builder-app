require_relative './menu.rb'
require_relative './order.rb'
require 'artii'

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

  def order_total_amount
    total = 0
    @order.get_ingredients.each do |name, quantity|    
      total += @menu.get_price(name) * quantity
    end
    return total
  end

  def display_order_total_amount
    message_info(" Custom Burger Order Price ... $ #{order_total_amount.round(2)} ")    
  end

  def message_warn( message)
    print TTY::Box.warn(message.light_white.on_light_blue, width: TTY::Screen.width)
  end

  def message_success(message)
    print TTY::Box.success message.light_white.on_light_blue,width: TTY::Screen.width,padding: 2 , align: :center
  end

  def message_frame(message)
    print TTY::Box.frame message.light_white.on_light_blue
  end

  def message_info(message)
    print TTY::Box.info message.light_white.on_light_blue
  end

  def art
    Gem.win_platform? ? (system "cls") : (system "clear")
    a = Artii::Base.new :font => 'slant'
    puts a.asciify('Wecome To The ')
    puts a.asciify('Burger Builder')
    puts
    puts
    puts TTY::Box.frame(" ====== PRESS 'ENTER' TO CONTINUE ======",width: TTY::Screen.width,padding: 2, align: :center).light_white.on_light_blue.blink
    puts
    puts
    puts
    gets
    print "\r" + ("\e[A\e[K"*6)
    Gem.win_platform? ? (system "cls") : (system "clear")
  end 

end
