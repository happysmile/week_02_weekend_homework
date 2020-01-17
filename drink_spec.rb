require('minitest/autorun')
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../drink.rb")

class TestDrink < MiniTest::Test

  def setup()
    @drink = Drink.new("Beers are Us", 5, 2)
  end

  def test_drink_name()
    assert_equal("Beers are Us", @drink.name)
  end

  def test_drink_price()
    assert_equal(5, @drink.price)
  end

end
