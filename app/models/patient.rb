require 'net/http'

class Patient

  attr_accessor :surname, :first_name, :birth_date

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def self.count
    uri = URI.parse('http://0.0.0.0:3001/api/v1/patients/count')
    params = { format: :json}
    uri.query = URI.encode_www_form(params)

    response = Net::HTTP.get_response(uri)
    if response.is_a?(Net::HTTPSuccess)
      puts response.body
      parsed_json = ActiveSupport::JSON.decode(response.body)
      puts "parsed json = #{parsed_json}"
      parsed_json.to_i
    end
  end

  def self.find(arguments)
    puts "query: #{arguments[:query]}"
    puts "order: sort_column = #{arguments[:order][:sort_column]}, sort_direction = #{arguments[:order][:sort_direction]}"
    puts "limit = #{arguments[:limit]}"
    puts "page = #{arguments[:page]}"
    patients = []
    uri = URI.parse('http://0.0.0.0:3001/api/v1/patients')
    params = { q: "#{arguments[:query]}",
               limit: "#{arguments[:limit]}",
               sort_column: "#{arguments[:order][:sort_column]}",
               sort_direction: "#{arguments[:order][:sort_direction]}",
               format: :json}
    uri.query = URI.encode_www_form(params)

    response = Net::HTTP.get_response(uri)
    if response.is_a?(Net::HTTPSuccess)
      puts response.body
      parsed_json = ActiveSupport::JSON.decode(response.body)
      parsed_json.each do |patient_json|
        puts "patient json = #{patient_json} and has class #{patient_json.class}"
        patient = Patient.new(patient_json)
        puts patient
        patients << patient
      end
    end
    patients
  end
end