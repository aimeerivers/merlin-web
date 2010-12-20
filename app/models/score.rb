class Score
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :score, type: Integer

  validates_presence_of :name

  scope :top, order_by(:score.desc, :created_at.desc)

end
