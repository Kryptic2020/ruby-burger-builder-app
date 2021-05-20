require_relative './burger_builder_app.rb'
require "tty-prompt"
require "tty-box"
require "colorize"
require 'colorized_string'
prompt = TTY::Prompt.new


# Create class for handling error when input is not a valid 
class EmptyInputError < StandardError
end
class WrongInputError < StandardError
end

# Create an instance of Burger
ingredients = {"fish" => 2.00,"chicken" => 2.00,"salad" => 0.70,"tomato" => 2.00, "cheese" => 1.50, "bacon" => 2.50,"egg" => 1.20,"onion" => 2.10,}
burger = Burger.new("Custom Burger", ingredients.sort.to_h)

# Create list of ingredient Options 
choices = []
ingredients.sort.to_h.each do |key, value|
  choices << key.capitalize
end
choices.push(' Done '.light_white.on_light_blue)

# Display Welcome message
  burger.art

# Create a loop so the user can keep adding ingredient until he is done
loop do
  #Gem.win_platform? ? (system "cls") : (system "clear")

  

  # Display Ingredient Price List
  burger.print_ingredients

  # Display Ordered Ingredients 
  burger.order.has_order ? burger.display_order : nil  

  # Display Order Total Amount  
  burger.order.has_order ? burger.display_order_total_amount : nil 
  
  # Display Ingredient Select Options  
  input = prompt.select(burger.message_frame("Which ingredient would you like to add to your Custom Burger?") , choices,per_page: 50,symbols: { marker: "==>" })

  #Break the loop is user is done
  if input == ' Done '.light_white.on_light_blue
    Gem.win_platform? ? (system "cls") : (system "clear")

    # Display token for collect and Pay    
    print burger.order.has_order ? burger.message_warn("    ==>    Your order number for collect & Pay is #{rand(36**8).to_s(36)}.     ==>    Total Price $#{burger.order_total_amount}.      ==>      Enjoy your Custom Burger!                            ") : nil
    break
  end

  # Display quantity input request
  begin
    burger.message_frame "How many would you like?"
    quantity = gets.strip

    # Handling errors
    raise EmptyInputError, "Empty input Error" if quantity == ""
    raise WrongInputError, "wrong input Error" if quantity.to_i == 0 
    rescue 
    print "\r" + ("\e[A\e[K")
    puts " Empty input is not a valid input, please insert only numbers greater than zero" if quantity == ""
    puts " #{quantity} is not a valid input, please insert only numbers greater than zero" if quantity.to_i == 0 && quantity != ""
    retry
  end
  # Adding ingredients to the order
  if quantity
    burger.add_to_order(input.downcase, quantity.to_i) 
  end
   
end

# Display Thanks message 
burger.order.has_order ? nil : burger.message_success("Thank you for visiting our Burger Builder App!!!")
