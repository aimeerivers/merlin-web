class Adventure

  attr_reader :current_room

  def initialize
    @current_room = Room.by_key('start')
  end

  def move(direction)
    @current_room = case(direction)
                    when 'north' then Room.by_key('trees')
                    when 'east' then Room.by_key('evergreen glade')
                    when 'south', 'west' then Room.by_key('grassy bank')
                    else @current_room
                    end
  end

  def description
    current_room.description
  end

end
