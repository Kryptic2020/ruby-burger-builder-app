class order

  def initialize
    @order_ingredients = Hash.new(0)
  end

  def add_ingredient(name, quantity)
    @order_ingredients[name] += quantity
  end

  def get_ingredients
    return @order_ingredients
  end

end