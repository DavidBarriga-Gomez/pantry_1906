require './lib/ingredient'
require './lib/recipe'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class RecipeTest < Minitest::Test
  def setup
    @cheese = Ingredient.new("Cheese", "C", 100)
    @mac = Ingredient.new("Macaroni", "oz", 30)
    @mac_and_cheese = Recipe.new("Mac and Cheese")
  end

  def test_existence
    assert_instance_of Recipe, @mac_and_cheese
  end

  def test_recipes_have_attributes
    assert_equal "Mac and Cheese", @mac_and_cheese.name
    assert_equal ({}), @mac_and_cheese.ingredients_required
  end

  def test_add_ingredient
    expected = {@cheese => 2, @mac => 8}
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
    assert_equal expected, @mac_and_cheese.ingredients_required
  end
end
