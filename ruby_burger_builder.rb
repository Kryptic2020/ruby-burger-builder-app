require "tty-prompt"
require "tty-box"



prompt = TTY::Prompt.new
require_relative './burger_builder_app.rb'

# Create an instance of Burger


  

ingredients = {"tomato" => 2.00, "cheese" => 1.50, "bacon" => 2.50}
burger = Burger.new("My custom burger", ingredients)
choices = []
ingredients.each do |key, value|
  choices << key.capitalize
end
choices << "Exit => "
loop do
Gem.win_platform? ? (system "cls") : (system "clear")
  burger.print_ingredients
  burger.display_order
  input = prompt.select("Which ingredient would you like to add to your burger?", choices)
  
  if input == 'Exit => '
    Gem.win_platform? ? (system "cls") : (system "clear")
    break
  end
  #Gem.win_platform? ? (system "cls") : (system "clear")
  puts TTY::Box.frame input
  puts TTY::Box.frame "How many would you like?"
  quantity = gets.to_i
  if quantity > 0
    burger.add_to_order(input, quantity)
  end

  

end
puts ' total price $'



# choices = [
#         {name: 'Search for a New Job', value: 'hello'},
#         {name: 'See My Applications', value: 'world'},
#         {name: 'Exit', value: 3}
#       ]
      
# input = prompt.select("Select an action?", ingredients)
# 
