class PaperField
  include Mongoid::Document
  validates :name, :value, :type, :alias, presence: true
  belongs_to :paper
  belongs_to :person_paper_field
  field :name
  field :type
  field :alias
end
