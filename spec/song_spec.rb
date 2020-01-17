require( 'minitest/autorun' )
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative( '../song.rb' )

class TestSong < MiniTest::Test

  def setup
    @song1 = Song.new("Let It Go", "Elza")
    @song2 = Song.new("Uptown Funk", "Bruno Mars")
  end

  def test_song_title
    assert_equal("Let It Go", @song1.title)
  end

  def test_song_singer
    assert_equal("Bruno Mars", @song2.singer)
  end

end
