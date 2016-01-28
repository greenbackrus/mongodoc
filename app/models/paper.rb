class Paper
  include Mongoid::Document
  validates :name, presence: true
  field :name
  has_many :paper_fields
end
