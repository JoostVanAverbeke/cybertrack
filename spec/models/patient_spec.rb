require 'rails_helper'

describe Patient do
  before(:each) do
    @patient_via_hash = Patient.new(surname: 'Van Averbeke', first_name: 'Joost', birth_date: Date.new(1964, 11, 20))
  end

  it 'let you create a new Patient instance with a hash' do
    expect(@patient_via_hash).not_to be_nil
  end

end