class Item
  include MongoMapper::Document

  key :name
  key :initial_room

  def self.use(item_name, room)
    results = room.obstacles.map do |obstacle|
      return obstacle.result if obstacle.item == item_name
    end.compact
    return 'Nothing happens.' if results.empty?
    results.first
  end

end
