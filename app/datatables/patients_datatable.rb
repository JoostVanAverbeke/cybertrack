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
        iTotalDisplayRecords: patients.total_entries,
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
    Patient.count
  end

  def patients
    @patients ||= fetch_patients
  end

  def fetch_patients
    patients = lookup_patients.page(page).per_page(per_page)
    if params[:sSearch].present?
      patients = patients.find_by_surname(params[:sSearch])
    end
    patients
  end

  def lookup_patients
      Patient.includes(:person).order("#{sort_column} #{sort_direction}")
  end

  def page
    page_length = params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[surname first_name birth_date]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end

end