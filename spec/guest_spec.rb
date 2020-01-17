require( 'minitest/autorun' )
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative( '../guest.rb' )
require_relative( '../song.rb' )

class TestGuest < MiniTest::Test

  def setup
    @guest1 = Guest.new("John", 78)
    @guest2 = Guest.new("Maria", 150)
    @song1 = Song.new("Let It Go", "Elza")
    @song2 = Song.new("Uptown Funk", "Bruno Mars")
  end

  def test_guest_name
    assert_equal("John", @guest1.name)
  end

  def test_guest_wallet_cash
    assert_equal(78, @guest1.wallet_cash)
  end

  def test_guest_favourite_song
    @guest1.add_favourite_song(@song1)
    assert_equal(@song1, @guest1.favourite_song)
    @guest1.add_favourite_song(@song2)
    assert_equal(@song2, @guest1.favourite_song)
  end

end
