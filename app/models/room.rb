class Room
  include MongoMapper::Document

  key :key
  key :description

  def self.by_key(key)
    find_by_key(key)
  end

  def available_directions
    Pathway.from_room(self.key).map(&:direction)
  end

end
