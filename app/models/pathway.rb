class Pathway < ActiveRecord::Base

  def self.from_room_in_direction(room_key, direction)
    find_by_from_and_direction(room_key, direction)
  end

end
