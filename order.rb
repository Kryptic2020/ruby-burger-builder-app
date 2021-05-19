class Order
  attr_reader :has_order
  def initialize
    @order_ingredients = Hash.new(0)
    @has_order = false
  end


  def add_ingredient(name, quantity)
    @has_order = true
    @order_ingredients[name] += quantity
  end

  def get_ingredients
    @has_order = true
    return @order_ingredients
  end

  def display
    print TTY::Box.frame " Your Custom Burger - Selected Ingredients ".light_white.on_blue    
    @order_ingredients.each {|k, v| puts "|      ".light_white.on_blue + "#{k.capitalize}".light_white.on_blue + " ".light_white.on_blue * (20 - k.length)+"... Qtty #{v.to_s}".light_white.on_blue + " ".light_white.on_blue * (8 - v.to_s.length) + "|".light_white.on_blue }
    puts "|___________________________________________|".light_white.on_blue    
    puts    
    return nil
  end  

end