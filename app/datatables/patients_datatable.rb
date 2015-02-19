class PatientsDatatable
  include Rails.application.routes.url_helpers
  include PatientsHelper
  delegate :image_tag, :params, :ct, :link_to, to: :@view

  def initialize(view)
    @view = view
  end
  
  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: total_records,
      iTotalDisplayRecords: 3,
      aaData: data
    }
  end

private

  def data
    patients.map do |patient|
      [
        patient.surname,
        patient.first_name,
        patient.birth_date
      ]
    end
  end
  
  def total_records
    20
  end

  def patients
    @patients ||= fetch_patients
  end

  def fetch_patients
    patient1 = Patient.new
    patient1.surname = 'Van Averbeke'
    patient1.first_name = 'Joost'
    patient1.birth_date = '20/11/1964'
    patient2 = Patient.new
    patient2.surname = 'Ampe'
    patient2.first_name = 'Nadine'
    patient2.birth_date = '23/06/1936'
    patient3 = Patient.new
    patient3.surname = 'Andersen'
    patient3.first_name = 'Trine'
    patient3.birth_date = '18/01/1967'
    [patient1, patient2, patient3]
  end
 #  def fetch_patients
 #    patients = lookup_patients.page(page).per_page(per_page)
 #    if params[:sSearch].present?
 #      patients = patients.find_by_name(params[:sSearch])
 #    end
 #    patients
 # end
 #
 #  def lookup_patients
 #    if @dentist.nil?
 #      patients = Patient.includes(:person).order("#{sort_column} #{sort_direction}")
 #    else
 #      patients = @dentist.patients.includes(:person).order("#{sort_column} #{sort_direction}")
 #    end
 #  end
 #
 #  def page
 #    page_length = params[:iDisplayStart].to_i/per_page + 1
 #  end
 #
 #  def per_page
 #    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
 #  end
 #
 #  def sort_column
 #    columns = %w[people.surname people.first_name people.birth_date]
 #    columns[params[:iSortCol_0].to_i]
 #  end
 #
 #  def sort_direction
 #    params[:sSortDir_0] == "desc" ? "desc" : "asc"
 #  end
    
end