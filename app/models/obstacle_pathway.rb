class ObstaclePathway < Pathway

  key :restriction
  key :item
  key :result
  key :fatal_without_item

  validates_presence_of :restriction

  def traverse(with_item = nil)
    unless with_item == self.item
      raise(AdventureErrors::FatalCannotPassError.new, self.restriction) if self.fatal_without_item
      raise(AdventureErrors::CannotPassError.new, self.restriction)
    end
    self.going_to
  end

end
