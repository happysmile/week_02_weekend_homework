class KaraokeBar

  attr_reader :name, :till_cash

  ENTRY_FEE = 5

  def initialize(name, till_cash)
    @name = name
    @till_cash = till_cash
    @rooms = []
    @refreshments = []
  end

  def add_a_room(room)
    @rooms.push(room)
  end

  def get_rooms()
    return @rooms
  end

  def add_a_refreshment(refreshment)
    @refreshments.push(refreshment)
  end

  def remove_a_refreshment(refreshment)
    if(@refreshments.include?(refreshment))
      @refreshments.delete(refreshment)
    end
  end

  def get_refreshments()
    return @refreshments
  end

  def can_guest_afford_this(guest, price)
    if (guest.wallet_cash >= price)
      return true
    else
      return false
    end
  end

  def add_money_to_till(money)
    @till_cash += money
  end

  def check_in_guest(guest, room)
    if (room.spaces_left_in_room() > 0)
      if (room.is_guest_in_room(guest) == false)
        if (can_guest_afford_this(guest, ENTRY_FEE) == true)
            add_money_to_till(ENTRY_FEE)
            guest.remove_money_from_wallet(ENTRY_FEE)
            room.add_guest_to_room(guest)
        end
      end
    else
      return "Sorry, the room is full"
    end
  end

  def check_out_guest(guest, room)
    if (room.is_guest_in_room(guest)==true)
      add_money_to_till(guest.tab)
      guest.remove_money_from_wallet(guest.tab)
      guest.reset_tab()
      room.remove_guest_from_room(guest)
    end
  end

  def sell_a_refreshment(guest, refreshment)
    if(@refreshments.include?(refreshment))
      money_to_pay = guest.tab + refreshment.price
      if(can_guest_afford_this(guest, money_to_pay))
        remove_a_refreshment(refreshment)
        guest.buy_a_refreshment(refreshment)
      end
    else
      return "Sorry, we have don't have any more #{refreshment} today"
    end
  end

end
