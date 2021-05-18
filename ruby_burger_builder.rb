require_relative './burger_builder_app.rb'

# Create an instance of Burger

ingredients = {"tomato" => 2.00, "cheese" => 1.50, "bacon" => 2.50}
burger = Burger.new("My custom burger", ingredients)


burger.print_ingredients


