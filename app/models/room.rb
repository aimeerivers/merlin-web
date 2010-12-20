class Room
  include Mongoid::Document

  field :key
  field :description

  validates_presence_of :key
  validates_presence_of :description

  index :key, unique: true

  embeds_many :pathways

  def self.by_key(key)
    cache_key = "#{Rails.env}:Room#by_key(#{key.gsub(/\W/, '-')})"
    Rails.cache.fetch(cache_key) do
      first(conditions: {key: key})
    end
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
