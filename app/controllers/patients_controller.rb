class PatientsController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json { render json: PatientsDatatable.new(view_context) }
    end
  end
end
