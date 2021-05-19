class Ingredient
  attr_reader :name, :price
  def initialize(name, price)
    @name = name
    @price = price
  end

  def to_s
    return "| "+"#{@name.capitalize}" +" "*(19 - @name.length)+"... $ #{@price}"+" " *(6 - @price.to_s.length)+"|"
  end

end