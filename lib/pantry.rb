class Pantry
  attr_reader :stock
  def initialize
    @stock = Hash.new(0)
end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, quantity)
    @stock[ingredient] += quantity
  end

  def enough_ingredients_for_recipe(recipe)
    # if stock_check(ingredient)
    # stock_check(ingredieng) >=

    # stock_check >= ingredients_amount

      recipe.amount_required[ingredient].each do |ingredient, quantity|
      stock_check(ingredient) >= quantity
    end
  end
end
