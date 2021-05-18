class Ingredient
  attr_reader :name, :price
  def initialize(name, price)
    @name = name
    @price = price
  end

  def to_s
    return "#{@name}" +" "*(10 - @name.length)+"... #{@price}"
  end
  
end