class Room
  include MongoMapper::Document

  key :key, String, required: true
  key :description, String, required: true

  has_many :pathways

  def self.by_key(key)
    find_by_key(key)
  end

  def pathway_in_direction(direction)
    pathways.detect{|p| p.direction == direction }
  end

  def available_directions
    pathways.map(&:direction)
  end

  def obstacles
    pathways.select{|p| p.is_a?(ObstaclePathway) }
  end

end
