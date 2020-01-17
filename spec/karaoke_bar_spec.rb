require( 'minitest/autorun' )
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

ENTRY_FEE = 5

require_relative( '../karaoke_bar.rb' )
require_relative( '../room.rb' )
require_relative( '../refreshments.rb' )
require_relative( '../song.rb' )
require_relative( '../guest.rb' )

class TestKaraokeBar < MiniTest::Test

  def setup()
    @karaoke_bar = KaraokeBar.new("Unicorn", 457)
    @song1 = Song.new("Let It Go", "Elza")
    @song2 = Song.new("Uptown Funk", "Bruno Mars")
    @song3 = Song.new("Happy", "Pharrell Williams")
    @song4 = Song.new("Shake It Off", "Taylor Swift")
    @song5 = Song.new("Blank Space", "Taylor Swift")
    @song6 = Song.new("Roar", "Katy Perry")
    @song7 = Song.new("Don't Stop Believin", "Journey")
    @guest1 = Guest.new("John", 78, @song2)
    @guest2 = Guest.new("Maria", 150, @song3)
    @guest3 = Guest.new("Phil", 49, @song4)
    @guest4 = Guest.new("Jane", 25, @song1)
    @guest5 = Guest.new("Rose", 4, @song5)
    @room = Room.new(13, 10)
    @room.add_guest_to_room(@guest1)
    @room.add_guest_to_room(@guest2)
    @small_room = Room.new(5, 3)
    @small_room.add_guest_to_room(@guest1)
    @small_room.add_guest_to_room(@guest2)
    @chips = Refreshment.new("chips", :food, 3)
    @coke = Refreshment.new("coke", :drink, 4)
    @peanuts = Refreshment.new("peanuts", :food, 2)
  end

  def test_can_guest_afford_this()
    assert_equal(true, @karaoke_bar.can_guest_afford_this(@guest1, ENTRY_FEE))
    assert_equal(false, @karaoke_bar.can_guest_afford_this(@guest5, ENTRY_FEE))
  end

  def test_add_money_to_till()
    assert_equal(461, @karaoke_bar.add_money_to_till(@guest5.wallet_cash))
  end

  def test_add_a_room()
    assert_equal(0, @karaoke_bar.get_rooms().count())
    @karaoke_bar.add_a_room(@Room)
    assert_equal(1, @karaoke_bar.get_rooms().count())
  end

  def test_check_in_guest()
    assert_equal(2, @room.guests_in_room().count())
    @karaoke_bar.check_in_guest(@guest4, @room)
    @karaoke_bar.check_in_guest(@guest3, @room)
    assert_equal(4, @room.guests_in_room().count())
  end

  def test_check_in_guest_with_favourite_song_in_playlist()
    @room.add_song_to_room(@song1)
    assert_equal("Whohooo! My favourite song is in the playlist!", @karaoke_bar.check_in_guest(@guest4, @room))
  end

  def test_check_in_guest_no_money()
    assert_equal(2, @room.guests_in_room().count())
    @karaoke_bar.check_in_guest(@guest5, @room)
    assert_equal(2, @room.guests_in_room().count())
  end

  def test_check_in_guest_who_is_already_there()
    assert_equal(2, @room.guests_in_room().count())
    @karaoke_bar.check_in_guest(@guest4, @room)
    assert_equal(3, @room.guests_in_room().count())
    @karaoke_bar.check_in_guest(@guest4, @room)
    assert_equal(3, @room.guests_in_room().count())
  end

  def test_check_in_guest_room_full()
    assert_equal(2, @small_room.guests_in_room().count())
    @karaoke_bar.check_in_guest(@guest3, @small_room)
    assert_equal(3, @small_room.guests_in_room().count())
    @karaoke_bar.check_in_guest(@guest4, @small_room)
    assert_equal(3, @small_room.guests_in_room().count())
  end

  def test_check_out_guest()
    assert_equal(2, @small_room.guests_in_room().count())
    @karaoke_bar.check_out_guest(@guest2, @small_room)
    assert_equal(1, @small_room.guests_in_room().count())
  end

  def test_check_out_guest_who_is_not_the_room()
    assert_equal(2, @small_room.guests_in_room().count())
    @karaoke_bar.check_out_guest(@guest4, @small_room)
    assert_equal(2, @small_room.guests_in_room().count())
  end

  def test_add_a_refreshment()
    assert_equal(0, @karaoke_bar.get_refreshments().count())
    @karaoke_bar.add_a_refreshment(@chips)
    assert_equal(1, @karaoke_bar.get_refreshments().count())
  end

  def test_remove_a_refreshment()
    @karaoke_bar.add_a_refreshment(@chips)
    @karaoke_bar.add_a_refreshment(@coke)
    @karaoke_bar.add_a_refreshment(@beer)
    assert_equal(3, @karaoke_bar.get_refreshments().count())
    @karaoke_bar.remove_a_refreshment(@chips)
    assert_equal(2, @karaoke_bar.get_refreshments().count())
  end

  def test_sell_a_refreshment()
    @karaoke_bar.add_a_refreshment(@chips)
    @karaoke_bar.add_a_refreshment(@coke)
    assert_equal(2, @karaoke_bar.get_refreshments().count())
    assert_equal(0, @guest1.bought_refreshments().count())
    assert_equal(457,@karaoke_bar.till_cash)
    assert_equal(78,@guest1.wallet_cash)
    @karaoke_bar.sell_a_refreshment(@guest1, @chips)
    assert_equal(1, @karaoke_bar.get_refreshments().count())
    assert_equal(1, @guest1.bought_refreshments().count())
    assert_equal(460,@karaoke_bar.till_cash)
    assert_equal(75,@guest1.wallet_cash)
  end


end
