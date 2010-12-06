class Pathway
  include MongoMapper::Document

  key :from
  key :direction
  key :going_to

  def self.from_room(room_key)
    all(conditions: {from: room_key})
  end

  def self.from_room_in_direction(room_key, direction)
    find_by_from_and_direction(room_key, direction)
  end

  def traverse(item_to_use = nil)
    self.going_to
  end

end
