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
    print TTY::Box.frame " Your Custom Burger Ingredients "
    
    @order_ingredients.each {|k, v| puts "| " + "#{k.capitalize}"+" "*(16 - k.length)+"... Qtty #{v}"+" " *(6 - v.to_s.length)+"|"}
    puts "|________________________________|"
    
    puts
    
    return nil
  end

  # def to_s
  #   return "#{@name}" +" "*(10 - @name.length)+"... #{@quantity}"
  # end

end