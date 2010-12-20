class Pathway
  include Mongoid::Document

  field :direction
  field :going_to
  field :after_effect

  embedded_in :room, inverse_of: :pathways

  def traverse(item_to_use = nil)
    self.going_to
  end

end
