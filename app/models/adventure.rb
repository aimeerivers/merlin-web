class Adventure

  attr_reader :description

  def initialize
    @description = "You wake up on a grassy bank at a cross-roads. It is warm and the bees are humming. There is a feeling of magic and mystery all around you."
  end

  def move(direction)
    @description = case(direction)
                   when 'north' then "You are on a path running North to South. Thick trees are at the foot of a mountain to the North."
                   when 'south' then "You are standing at a cross-roads. On a grassy bank a figure lies sleeping."
                   end
  end

end
