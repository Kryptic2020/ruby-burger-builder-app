class Order
  
  def initialize
    @order_ingredients = Hash.new(0)
  end

  def add_ingredient(name, quantity)
    @order_ingredients[name] += quantity
  end

  def get_ingredients
    return @order_ingredients
  end

  def display
    print TTY::Box.frame " Your Custom Burger Ingredients ".light_magenta.on_black
    
    @order_ingredients.each {|k, v| puts "| ".light_magenta.on_black + "#{k.capitalize}".light_magenta.on_black + " ".light_magenta.on_black * (16 - k.length)+"... Qtty #{v.to_s}".light_magenta.on_black + " ".light_magenta.on_black * (6 - v.to_s.length) + "|".light_magenta.on_black }
    puts "|________________________________|".light_magenta.on_black
    
    
    puts
    
    return nil
  end

  # def to_s
  #   return "#{@name}" +" "*(10 - @name.length)+"... #{@quantity}"
  # end

end