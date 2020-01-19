class Guest

  attr_reader :name, :wallet_cash, :favourite_song, :tab

  def initialize(name, wallet_cash, favourite_song=nil)
    @name = name
    @wallet_cash = wallet_cash
    @favourite_song = favourite_song
    @refreshments = []
    @tab = 0
  end

  def remove_money_from_wallet(money)
    if(@wallet_cash >= money)
      @wallet_cash -= money
    end
  end

  def bought_refreshments()
    return @refreshments
  end

  def buy_a_refreshment(refreshment)
    @refreshments.push(refreshment)
    @tab += refreshment.price
  end

  def reset_tab()
    @tab = 0
  end

  def cheer_loudly()
   return "Whohooo! My favourite song is in the playlist!"
  end

end
