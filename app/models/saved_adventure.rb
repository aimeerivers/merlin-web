class SavedAdventure
  include MongoMapper::Document

  key :user_id, ObjectId
  key :name, String, required: true
  timestamps!

  belongs_to :user

  scope :newest_first, order: [['created_at', 'descending']]

end
