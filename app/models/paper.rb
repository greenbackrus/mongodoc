class Paper
  include Mongoid::Document
  validates :type, presence :true
  field :type
  embeds_many :paper_fields
  embedded_in :person, inverse_of: pappers
end
