class Adventure

  attr_reader :current_room

  def initialize
    @current_room = Room.by_key('start')
  end

  def move(direction)
    pathway = Pathway.from_room_in_direction(current_room.key, direction)
    return if pathway.nil?
    @current_room = Room.by_key(pathway.going_to)
  end

  def description
    current_room.description
  end

end
