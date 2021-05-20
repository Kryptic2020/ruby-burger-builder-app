require_relative '../burger_builder_app.rb'

describe Burger do

  it "Should create a Burger Builder with a name" do
  name = "Custom Burger"
  ingredients = {}
  burger = Burger.new(name, ingredients)
  expect(burger.name).to eq(name)
  end

  it "Should create a Burger Builder with ingredients" do
  name = "Custom Burger"
  ingredients = {"tomato" => 2.00, "egg" => 3.00, "cheese" => 4.00}
  burger = Burger.new(name, ingredients)
  expect(burger.menu.ingredients.length).to be(3)
  end

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

describe Menu do
  
  it "Should be able to add ingredient to ingredients menu list" do    
    ingredients = {}
    menu = Menu.new
    menu.add_ingredient("tomato", 2.00)
    menu.add_ingredient("cheese", 3.00)
  expect(menu.ingredients.length).to be(2)
  end

  it "Should get ingredient price from the ingredients menu list" do    
    menu = Menu.new
    menu.add_ingredient("tomato", 2.00)
    menu.add_ingredient("cheese", 3.00)
  expect(menu.get_price("tomato")).to be(2.00)
  end
  
end