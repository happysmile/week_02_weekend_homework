class KaraokeBar

  attr_reader :name

  ENTRY_FEE = 5

  def initialize(name, till_cash)
    @name = name
    @till_cash = till_cash
    @rooms = []
    @refreshments = []
  end


end
