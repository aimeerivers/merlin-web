class Score
  include MongoMapper::Document

  key :name, String, required: true
  key :score, Integer
  timestamps!

  scope :top, order: [['score', 'descending'], ['created_at', 'descending']]

end
