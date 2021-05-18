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
    puts "Your custom burger ingredients"
    puts "_______________________________"
    
    @order_ingredients.each {|k, v| puts "#{k}"+" "*(20 - k.length)+"... Qtty #{v}"}
    puts
    return nil
  end

  # def to_s
  #   return "#{@name}" +" "*(10 - @name.length)+"... #{@quantity}"
  # end

end