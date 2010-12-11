class Pathway
  include MongoMapper::EmbeddedDocument

  key :direction, String
  key :going_to, String

  def traverse(item_to_use = nil)
    self.going_to
  end

end
