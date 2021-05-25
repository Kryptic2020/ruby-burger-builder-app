require_relative '../burger_builder_app.rb'

#This is a functional and reliability test, to make sure it meets all of the requirements on the creation of the burger instance and its methods, and a missing or invalid input wont break the application.
describe Burger do
  
  # Testing if the initialization method is receiving a valid first required argument and it is not nil, also testing if the class variable name has correctly received its value. 
  it "Should create a Burger Builder instance with a name" do
  name = "Custom Burger"
  ingredients = {}
  burger = Burger.new(name, ingredients)
  expect(burger.name).to eq(name)
  end

  # Testing if the initialization method is receiving a valid second required argument and it is not nil, also testing if the class variable ingredients has correctly received its values. 
  it "Should create a Burger Builder instance with ingredients" do
  name = "Custom Burger"
  ingredients = {"tomato" => 2.00, "egg" => 3.00, "cheese" => 4.00}
  burger = Burger.new(name, ingredients)
  expect(burger.menu.ingredients.length).to be(3)
  end
  
  #Testing if the methods 'order_total_amount' is performing accurate calculation and returning the correct value and data type
  it "Should calculate the order total amount" do
  name = "Custom Burger"
  ingredients = {"tomato" => 2.00, "egg" => 3.00, "cheese" => 4.00}
  burger = Burger.new(name, ingredients)
  ingredient = "cheese"
  quantity = 2
  burger.add_to_order(ingredient, quantity)
  expect(burger.order_total_amount).to be(8.00)
  end
  
end

#This is a functional and reliability test, to make sure it meets all of the requirements on the creation of the menu instance and its methods, and a missing or invalid input wont break the application.
describe Menu do
  
  #Testing if the methods 'add_ingredient' is receiving a valid and correct arguments and correctly adding it to the class variable 'ingredients'.
  it "Should be able to add ingredient to ingredients menu list" do    
    ingredients = {}
    menu = Menu.new
    menu.add_ingredient("tomato", 2.00)
    menu.add_ingredient("cheese", 3.00)
  expect(menu.ingredients.length).to be(2)
  end
  
  #Testing if the methods 'get_price' is returning the correct value and data type.
  it "Should get ingredient price from the ingredients menu list" do    
    menu = Menu.new
    menu.add_ingredient("tomato", 2.00)
    menu.add_ingredient("cheese", 3.00)
  expect(menu.get_price("tomato")).to be(2.00)
  end
  
end