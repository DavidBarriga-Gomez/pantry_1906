require './lib/pantry'
require './lib/ingredient'
require './lib/recipe'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class PantryTest < Minitest::Test
  def setup
    @pantry = Pantry.new
    @cheese = Ingredient.new("Cheese", "C", 50)
    @mac = Ingredient.new("Macaroni", "oz", 200)
    @mac_and_cheese = Recipe.new("Mac and Cheese")
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
  end

  def test_existence
    assert_instance_of Pantry, @pantry
  end

  def test_stock
    # @mac_and_cheese.add_ingredient(@cheese, 2)
    # @mac_and_cheese.add_ingredient(@mac, 8)
    assert_equal ({}), @pantry.stock
  end

  def test_stock_check
    assert_equal 0, @pantry.stock_check(@cheese)
  end

  def test_restock
    @pantry.restock(@cheese, 5)
    @pantry.restock(@cheese, 10)
    assert_equal 15, @pantry.stock_check(@cheese)
  end

  def test_enough_ingredients_for_recipe
    assert_equal false, @pantry.enough_ingredients_for_recipe(@mac_and_cheese)
    @pantry.restock(@mac, 7)
    assert_equal false, @pantry.enough_ingredients_for_recipe(@mac_and_cheese)
    @pantry.restock(@mac, 1)
    assert_equal true, @pantry.enough_ingredients_for_recipe(@mac_and_cheese)
  end
end
