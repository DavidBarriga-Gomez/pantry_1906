require 'pry'

class Recipe
  attr_reader :name, :ingredients_required
  def initialize(name)
    @name = name
    @ingredients_required = {}
  end

  def add_ingredient(object, quantity)

  end
end
