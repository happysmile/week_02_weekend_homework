require( 'minitest/autorun' )
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative( '../room.rb' )
require_relative( '../song.rb' )
require_relative( '../guest.rb' )

class TestRoom < MiniTest::Test

  def setup
    @room = Room.new(13, 10)
    @song1 = Song.new("Let It Go", "Elza")
    @song2 = Song.new("Uptown Funk", "Bruno Mars")
    @song3 = Song.new("Happy", "Pharrell Williams")
    @song4 = Song.new("Shake It Off", "Taylor Swift")
    @song5 = Song.new("Blank Space", "Taylor Swift")
    @song6 = Song.new("Roar", "Katy Perry")
    @song7 = Song.new("Don't Stop Believin", "Journey")
    @room.add_song_to_room(@song1)
    @room.add_song_to_room(@song2)
    @room.add_song_to_room(@song3)
    @room.add_song_to_room(@song4)
    @room.add_song_to_room(@song5)
    @room.add_song_to_room(@song6)
    @guest1 = Guest.new("John", 78)
    @guest2 = Guest.new("Maria", 150)
    @guest3 = Guest.new("Phil", 49)
    @guest4 = Guest.new("Jane", 25)
    @room.add_guest_to_room(@guest1)
    @room.add_guest_to_room(@guest2)
    @small_room = Room.new(5, 3)
    @small_room.add_guest_to_room(@guest1)
    @small_room.add_guest_to_room(@guest2)
  end

  def test_room_number
    assert_equal(13, @room.number)
  end

  def test_is_song_in_room
    assert_equal(true, @room.is_song_in_room(@song1))
    assert_equal(false, @room.is_song_in_room(@song7))
  end

  def test_add_song_to_room
    assert_equal(false,  @room.is_song_in_room(@song7))
    @room.add_song_to_room(@song7)
    assert_equal(true,  @room.is_song_in_room(@song7))
  end

  def test_remove_song_from_room
    assert_equal(true,  @room.is_song_in_room(@song3))
    @room.remove_song_from_room(@song3)
    assert_equal(false,  @room.is_song_in_room(@song3))
  end

  def test_is_guest_in_room
    assert_equal(true, @room.is_guest_in_room(@guest1))
    assert_equal(false, @room.is_guest_in_room(@guest3))
  end

  def test_add_guest_to_room
    assert_equal(false,  @room.is_guest_in_room(@guest3))
    @room.add_guest_to_room(@guest3)
    assert_equal(true,  @room.is_guest_in_room(@guest3))
  end

  def test_remove_guest_from_room
    assert_equal(true,  @room.is_guest_in_room(@guest2))
    @room.remove_guest_from_room(@guest2)
    assert_equal(false,  @room.is_guest_in_room(@guest2))
  end

  def test_guests_in_room
    assert_equal(2, @small_room.guests_in_room.count())
    @small_room.add_guest_to_room(@guest3)
    assert_equal(3, @small_room.guests_in_room.count())
  end

  def test_spaces_left_in_room
    assert_equal(1, @small_room.spaces_left_in_room())
    assert_equal(2, @small_room.guests_in_room.count())
    @small_room.add_guest_to_room(@guest3)
    assert_equal(0, @small_room.spaces_left_in_room())
    assert_equal(3, @small_room.guests_in_room.count())
    @small_room.add_guest_to_room(@guest4)
    assert_equal(0, @small_room.spaces_left_in_room())
    assert_equal(3, @small_room.guests_in_room.count())
    assert_equal("Sorry, the room is full", @small_room.add_guest_to_room(@guest4))
  end



end
