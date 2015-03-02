class Patient

  attr_accessor :surname, :first_name, :birth_date

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

end