class SavedAdventure
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name

  validates_presence_of :name

  referenced_in :user

  scope :newest_first, order_by(:created_at.desc)

end
