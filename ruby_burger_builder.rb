require "tty-prompt"
require "tty-box"
require "colorize"
require 'colorized_string'



prompt = TTY::Prompt.new
require_relative './burger_builder_app.rb'

# Create an instance of Burger

ingredients = {"fish" => 2.00,"chicken" => 2.00,"salad" => 0.70,"tomato" => 2.00, "cheese" => 1.50, "bacon" => 2.50,"egg" => 1.20,"onion" => 2.10,}
burger = Burger.new("Custom Burger", ingredients.sort.to_h)

choices = []
ingredients.sort.to_h.each do |key, value|
  choices << key.capitalize
end
choices.push(' Exit & Pay '.light_white.on_blue)
loop do
  Gem.win_platform? ? (system "cls") : (system "clear")
  puts TTY::Box.frame "Welcome to the #{burger.name} Builder App".light_white.on_blue
  burger.print_ingredients
  burger.order.has_order ? burger.display_order : nil  
  burger.order.has_order ? burger.display_order_total_amount : nil 
  
  x = TTY::Box.frame "Which ingredient would you like to add to your Custom Burger?".light_white.on_blue
  input = prompt.select(x , choices,per_page: 50,symbols: { marker: "==>" })
  
  if input == ' Exit & Pay '.light_white.on_blue
    Gem.win_platform? ? (system "cls") : (system "clear")
    break
  end
  #Gem.win_platform? ? (system "cls") : (system "clear")
  
  puts TTY::Box.frame "How many would you like?".light_white.on_blue
  quantity = gets.to_i
  if quantity > 0
    burger.add_to_order(input.downcase, quantity)
  end
end

print TTY::Box.success "Thank you! Enjoy your Custom Burger! See you soon"




# choices = [
#         {name: 'Search for a New Job', value: 'hello'},
#         {name: 'See My Applications', value: 'world'},
#         {name: 'Exit', value: 3}
#       ]
      
# input = prompt.select("Select an action?", ingredients)
# 
