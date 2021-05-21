require_relative './burger_builder_app.rb'
require_relative './styles.rb'
require "tty-prompt"
require "tty-box"
require "colorize"
require 'colorized_string'
require "tty-table"
prompt = TTY::Prompt.new


# Create class for handling error when input is not a valid 
class EmptyInputError < StandardError
end
class WrongInputError < StandardError
end

# Create an instance of Burger
ingredients = {"fish" => 2.00,"chicken" => 2.00,"salad" => 0.70,"tomato" => 2.00, "cheese" => 1.50, "bacon" => 2.50,"egg" => 1.20,"beef" => 2.10,}
burger = Burger.new("Custom Burger", ingredients.sort.to_h)

# Create list of ingredient Options 
choices = []
ingredients.sort.to_h.each do |key, value|
  choices << key.capitalize.light_white.on_light_blue
end
choices.push(' Done '.black.on_light_white)

# Display Welcome message
  art()

# Create a loop so the user can keep adding ingredient until he is done
loop do  

  # Display Ingredient Price List
  burger.print_ingredients

  # Display Ordered Ingredients 
  burger.order.has_order ? burger.display_order : nil  

  # Display Order Total Amount  
  burger.order.has_order ? burger.display_order_total_amount : nil 
  puts 

  # Display Ingredient Select Options  
  input = prompt.select(message_frame("Which ingredient would you like to add to your Custom Burger?") , choices,per_page: 50,symbols: { marker: "=>".blue.on_light_green.bold })

  #Break the loop is user is done
  if input == ' Done '.black.on_light_white
    Gem.win_platform? ? (system "cls") : (system "clear")

    # Display token and price for collect and Pay  
      rows = []
      rows << ["   ==>  Your order number for collect & Pay is " + "#{rand(36**8).to_s(36)}".bold]
      rows << ["   ==>  Total Price " + "$#{burger.order_total_amount.round(2)}.".bold]
      rows << ["   ==>  Enjoy your Custom Burger!".bold]    
    table = TTY::Table.new(rows)
    message = "#{table.render(:unicode, width: TTY::Screen.width, resize: true)}".black.on_light_yellow
    puts
    print burger.order.has_order ? message : nil
    puts
    puts
    puts
    puts
    puts
    puts
    break
  end

  # Display quantity input request
  begin
    message_frame "How many would you like?"
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
    burger.add_to_order(input.downcase.uncolorize, quantity.to_i) 
  end
   
end

# Display Thanks message 
burger.order.has_order ? nil : message_success("Thank you for visiting our Burger Builder App!!!")
