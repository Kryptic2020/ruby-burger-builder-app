require_relative './menu.rb'
require_relative './order.rb'

class Burger
  attr_reader :name, :menu
  def initialize(name, ingredient)
    @name = name
    @menu = Menu.new
  end
end
