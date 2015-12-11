class Paper
  include Mongoid::Document
  field :type
  field :date, type :date
  field :number
  field :paper_fields, type :hash
  embedded_in :person, inverse_of: pappers
end
