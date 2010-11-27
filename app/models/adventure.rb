class Adventure

  attr_reader :current_room

  def initialize
    set_current_room('start')
  end

  def move(direction)
    pathway = Pathway.from_room_in_direction(current_room.key, direction)
    return false if pathway.nil?
    set_current_room(pathway.going_to)
  end

  def description
    current_room.description
  end

  private

  def set_current_room(key)
    room = Room.by_key(key)
    return false if room.nil?
    @current_room = room
  end

end
