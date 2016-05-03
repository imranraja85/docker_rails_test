class Person
  include Mongoid::Document
  field :name, type: String

  validates :name, length: { is: 6 }
end
