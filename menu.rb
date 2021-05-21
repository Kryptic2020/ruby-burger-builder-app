require_relative './ingredient.rb'
require_relative './styles.rb'
require "tty-box"
require "tty-table"

class Menu
  attr_reader :ingredients
  def initialize
    @ingredients = []
  end

  def add_ingredient(name, price)
    ingredient = Ingredient.new(name, price)
    @ingredients << ingredient
  end

  def display_ingredients
    print message_magenta(" *** Custom Burger - Ingredient Price List ***  ")
    rows = []
    @ingredients.each do|item| 
      arr = ["     #{item.name.capitalize}", "   $ #{item.price}"]
      rows << arr
    end
    table = TTY::Table.new(rows)
    print "#{table.render(:unicode, width: TTY::Screen.width, resize: true)}".light_magenta.on_blue   
    
    return nil   
  end

  def get_price(name)
    @ingredients.each do |ingredient|
      if ingredient.name == name
      return ingredient.price.to_f
      end  
    end
  end

end
