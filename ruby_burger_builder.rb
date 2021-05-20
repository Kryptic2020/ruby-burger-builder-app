require_relative './burger_builder_app.rb'
require "tty-prompt"
require "tty-box"
require "colorize"
require 'colorized_string'
prompt = TTY::Prompt.new

# Create an instance of Burger
ingredients = {"fish" => 2.00,"chicken" => 2.00,"salad" => 0.70,"tomato" => 2.00, "cheese" => 1.50, "bacon" => 2.50,"egg" => 1.20,"onion" => 2.10,}
burger = Burger.new("Custom Burger", ingredients.sort.to_h)

# Create list of ingredient Options 
choices = []
ingredients.sort.to_h.each do |key, value|
  choices << key.capitalize
end
choices.push(' Done '.light_white.on_light_blue)

# Create a loop so the user can keep adding ingredient until he is done
loop do
  Gem.win_platform? ? (system "cls") : (system "clear")

  # Display Welcome message
  puts TTY::Box.frame "Welcome to the #{burger.name} Builder App".light_white.on_light_blue

  # Display Ingredient Price List
  burger.print_ingredients

  # Display Ordered Ingredients 
  burger.order.has_order ? burger.display_order : nil  

  # Display Order Total Amount  
  burger.order.has_order ? burger.display_order_total_amount : nil 
  
  # Display Ingredient Select Options    
  ingredient_question = TTY::Box.frame "Which ingredient would you like to add to your Custom Burger?". 
  light_white.on_light_blue
  input = prompt.select(ingredient_question , choices,per_page: 50,symbols: { marker: "==>" })

  #Break the loop is user is done
  if input == ' Done '.light_white.on_light_blue
    Gem.win_platform? ? (system "cls") : (system "clear")

    # Display token for collect and Pay
    token_info = TTY::Box.warn "Your order number for collect & Pay is #{rand(36**8).to_s(36)}. Enjoy your Custom Burger!".light_white.on_blue
    print burger.order.has_order ? token_info : nil
    break
  end

  # Display quantity input request
  puts TTY::Box.frame "How many would you like?".light_white.on_light_blue
  quantity = gets.to_i

  # Add quantity to order
  if quantity > 0
    burger.add_to_order(input.downcase, quantity)
  end
  
end

# Display Thanks message
 thanks  = TTY::Box.success  "Thank you for visiting our Burger Builder App!!!".light_white.on_light_blue
puts burger.order.has_order ? nil : thanks
