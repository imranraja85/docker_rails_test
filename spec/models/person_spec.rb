require 'rails_helper'

RSpec.describe Person, type: :model do
  subject(:person) { Person.new( name: 'Suraya' ) }

  it { should be_valid }
end
