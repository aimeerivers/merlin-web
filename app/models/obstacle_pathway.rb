class ObstaclePathway < Pathway

  key :restriction, String, required: true
  key :item, String
  key :result, String
  key :fatal_without_item, Boolean

  def traverse(with_item = nil)
    unless with_item == self.item
      raise(AdventureErrors::FatalCannotPassError.new, self.restriction) if self.fatal_without_item
      raise(AdventureErrors::CannotPassError.new, self.restriction)
    end
    self.going_to
  end

end
