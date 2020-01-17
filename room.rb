class Room

  attr_reader :number

  def initialize(number, spaces)
    @number = number
    @spaces = spaces
    @songs = []
    @guests = []
  end

  def is_song_in_room(song)
    return @songs.include?(song)
  end

  def add_song_to_room(song)
    if(is_song_in_room(song) == false)
      @songs.push(song)
    end
  end

  def remove_song_from_room(song)
    if(is_song_in_room(song) == true)
      @songs.delete(song)
    end
  end

  def is_guest_in_room(guest)
    return @guests.include?(guest)
  end

  def guests_in_room()
    return @guests
  end

  def spaces_left_in_room()
    if(@spaces >= @guests.count())
      spaces_left = @spaces - @guests.count()
      return spaces_left
    else
      return 0
    end
  end

  def add_guest_to_room(guest)
    if (spaces_left_in_room() > 0)
      if(!is_guest_in_room(guest))
        @guests.push(guest)
        if(@songs.include?(guest.favourite_song))
          return guest.cheer_loudly()
        end
      end
    else
      return "Sorry, the room is full"
    end
  end

  def remove_guest_from_room(guest)
    if(is_guest_in_room(guest))
      @guests.delete(guest)
    end
  end

end
