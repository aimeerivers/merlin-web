class Room

  attr_reader :description, :key

  def initialize(params)
    @description = params[:description]
    @key = params[:key]
  end

  def self.by_key(key)
    description = case(key)
                  when 'start' then "You wake up on a grassy bank at a cross-roads. It is warm and the bees are humming. There is a feeling of magic and mystery all around you."
                  when 'grassy bank' then "You are standing at a cross-roads. On a grassy bank a figure lies sleeping."
                  when 'trees' then "You are on a path running North to South. Thick trees are at the foot of a mountain to the North."
                  when 'evergreen glade' then "You are in an evergreen glade, with red spotted toadstools growing in a ring. A path runs from East to West."
                  when 'deep river' then "To the South a deep river is running swiftly. Paths lead North and East. A golden spire can be seen to the South across the water."
                  end
    new(description: description, key: key)
  end

end
