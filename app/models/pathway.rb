class Pathway

  PATHWAYS = {
    'start.north' => 'trees',
    'start.east' => 'evergreen glade',
    'start.south' => 'deep river',

    'grassy bank.north' => 'trees',
    'grassy bank.east' => 'evergreen glade',
    'grassy bank.south' => 'deep river',

    'trees.south' => 'grassy bank',
    'evergreen glade.west' => 'grassy bank',
    'deep river.north' => 'grassy bank'
  }

  attr_reader :going_to

  def initialize(params)
    @going_to = params[:going_to]
  end

  def self.from_room_in_direction(room_key, direction)
    going_to = PATHWAYS["#{room_key}.#{direction}"]
    return nil if going_to.nil?
    new(going_to: going_to)
  end
end
