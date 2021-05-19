class Ingredient
  attr_reader :name, :price
  def initialize(name, price)
    @name = name
    @price = price
  end

  def to_s
    return "|     "+"#{@name.capitalize}" +" "*(25 - @name.length)+"... $ #{@price}"+" " *(12 - @price.to_s.length)+"|"
  end

end