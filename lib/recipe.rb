require 'pry'

class Recipe
  attr_reader :name, :ingredients_required
  def initialize(name)
    @name = name
    @ingredients_required = {}
  end

  def add_ingredient(ingredient_object, quantity)
    @ingredients_required[ingredient_object] = quantity
  end

  def amount_required(ingredient)
    @ingredients_required[ingredient]
  end

  def ingredient
    @ingredients_required.keys
  end

  def total_calories
    @ingredients_required.sum do |ingredient|
      ingredient.calories * quantity
  end
end
