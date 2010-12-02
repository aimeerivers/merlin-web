class ObstaclePathway < Pathway

  validates_presence_of :restriction, :item, :result

  def traverse(with_item = nil)
    raise(AdventureErrors::CannotPassError.new, self.restriction) unless with_item == self.item
    self.going_to
  end

end
