class Adventure

  attr_reader :current_room

  def initialize
    @current_room = Room.by_key('start')
  end

  def move(direction)
    @current_room = case(direction)
                    when 'north' then Room.by_key('trees')
                    when 'south' then Room.by_key('grassy bank')
                    end
  end

  def description
    current_room.description
  end

end
