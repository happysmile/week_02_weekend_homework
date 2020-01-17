require( 'minitest/autorun' )
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative( '../karaoke_bar.rb' )

class TestKaraokeBar < MiniTest::Test

  def setup

  end

end
