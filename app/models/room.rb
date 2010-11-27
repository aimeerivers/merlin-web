class Room

  attr_reader :description

  def initialize(params)
    @description = params[:description]
  end

  def self.by_key(key)
    description = case(key)
                  when 'start' then "You wake up on a grassy bank at a cross-roads. It is warm and the bees are humming. There is a feeling of magic and mystery all around you."
                  when 'grassy bank' then "You are standing at a cross-roads. On a grassy bank a figure lies sleeping."
                  when 'trees' then "You are on a path running North to South. Thick trees are at the foot of a mountain to the North."
                  end
    new(description: description)
  end

end
