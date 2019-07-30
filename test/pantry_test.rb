require './lib/pantry'
require './lib/ingredient'
require './lib/recipe'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class PantryTest < Minitest::Test
  def setup
    @pantry = Pantry.new
  end

  def test_existence
    assert_instance_of Pantry, @pantry
  end
end
