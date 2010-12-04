class Room < ActiveRecord::Base

  def self.by_key(key)
    find_by_key(key)
  end

  def name
    key.titlecase
  end

end
