class Item < ActiveRecord::Base

  def self.use(item_name, room)
    obstacles = ObstaclePathway.from_room(room.key)
    results = obstacles.map do |obstacle|
      return obstacle.result if obstacle.item == item_name
    end.compact
    return 'Nothing happens.' if results.empty?
    results.first
  end

end
