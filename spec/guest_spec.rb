require( 'minitest/autorun' )
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative( '../guest.rb' )
require_relative( '../song.rb' )
require_relative( '../refreshments.rb' )

class TestGuest < MiniTest::Test

  def setup()
    @song1 = Song.new("Let It Go", "Elza")
    @song2 = Song.new("Uptown Funk", "Bruno Mars")
    @guest1 = Guest.new("John", 78, @song1)
    @guest2 = Guest.new("Maria", 150, @song2)
    @guest3 = Guest.new("Jay", 150)
    @chips = Refreshment.new("chips", :food, 3)
  end

  def test_guest_name()
    assert_equal("John", @guest1.name)
  end

  def test_guest_wallet_cash()
    assert_equal(78, @guest1.wallet_cash)
  end

  def test_guest_favourite_song()
    assert_equal(@song2, @guest2.favourite_song)
  end

  def test_guest_without_favourite_song()
    assert_nil(@guest3.favourite_song)
  end

  def test_remove_money_from_wallet()
    @guest2.remove_money_from_wallet(50)
    assert_equal(100, @guest2.wallet_cash)
  end

  def test_remove_money_from_wallet_not_enough_money()
    @guest1.remove_money_from_wallet(100)
    assert_equal(78, @guest1.wallet_cash)
  end

  def test_cheer_loudly()
    assert_equal("Whohooo! My favourite song is in the playlist!", @guest1.cheer_loudly())
  end

  def test_buy_a_refreshment()
    @guest1.buy_a_refreshment(@chips)
    assert_equal(1,@guest1.bought_refreshments.count())
  end

end
