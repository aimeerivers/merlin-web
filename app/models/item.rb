class Item
  include Mongoid::Document

  field :name
  field :initial_rooms, type: Array

  index :name, unique: true

  validates_presence_of :name
  validates_presence_of :initial_rooms

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
    where(:name.in => items).sum(:score).to_i
  end

  def self.best_possible_score
    Rails.cache.fetch("#{Rails.env}:Item#best_possible_score") do
      sum(:score).to_i
    end
  end

end
