require( 'minitest/autorun' )
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative( '../refreshments.rb' )

class TestRefreshments < MiniTest::Test

  def setup

  end

end
