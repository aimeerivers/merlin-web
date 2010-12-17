class Item
  include MongoMapper::Document

  key :name, String, required: true
  key :initial_rooms, Array, required: true

  def initial_room
    initial_rooms[rand(initial_rooms.size)]
  end

  def self.use(item_name, room)
    results = room.obstacles.map do |obstacle|
      return obstacle.result if obstacle.item == item_name
    end.compact
    return 'Nothing happens.' if results.empty?
    results.first
  end

  def self.score_for_items(items)
    all(:name.in => items).sum(&:score)
  end

  def self.best_possible_score
    all.sum(&:score)
  end

  def self.all_by_name
    all.map(&:name).sort
  end

end
