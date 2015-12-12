class Person
  include Mongoid::Document
  validates :first_name, :family_name, :fathers_name, :date_of_birth, presence: true
  field :first_name
  field :fathers_name
  field :family_name
  field :date_of_birth, type: Date
  embeds_many :passports
  embeds_many :papers
  has_many :documents
end
