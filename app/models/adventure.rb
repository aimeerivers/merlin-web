class Adventure

  attr_reader :current_room

  def initialize
    @current_room = Room.by_key('start')
  end

  def move(direction)
    return unless (pathway = Pathway.from_room_in_direction(current_room.key, direction))
    return unless (new_room = Room.by_key(pathway.going_to))
    @current_room = new_room
  end

  def description
    current_room.description
  end

end
