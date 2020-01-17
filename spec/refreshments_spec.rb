require( 'minitest/autorun' )
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative( '../refreshments.rb' )

class TestRefreshments < MiniTest::Test

  def setup()
    @chips = Refreshment.new("chips", :food, 3)
    @coke = Refreshment.new("coke", :drink, 4)
    @peanuts = Refreshment.new("peanuts", :food, 2)
    @pizza = Refreshment.new("pizza", :food, 7)
    @burger = Refreshment.new("burger", :food, 11)
    @beer = Refreshment.new("beer", :food, 5)
    @wine = Refreshment.new("beer", :food, 6)
  end

  def test_refreshments_name()
    assert_equal("chips", @chips.name)
  end

  def test_refreshments_type()
    assert_equal(:food, @chips.type)
  end

  def test_refreshments_price()
    assert_equal(3, @chips.price)
  end


end
