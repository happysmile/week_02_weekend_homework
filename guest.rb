class Guest

  attr_reader :name, :wallet_cash, :favourite_song

  def initialize(name, wallet_cash)
    @name = name
    @wallet_cash = wallet_cash
    @favourite_song = nil
  end

  def add_favourite_song(song)
    @favourite_song = song
  end

end
