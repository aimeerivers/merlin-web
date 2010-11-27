class Adventure

  attr_reader :description

  def initialize
    @description = "You wake up on a grassy bank at a cross-roads. It is warm and the bees are humming. There is a feeling of magic and mystery all around you."
  end

  def move(direction)
    @description = "You are on a path running North to South. Thick trees are at the foot of a mountain to the North."
  end

end
