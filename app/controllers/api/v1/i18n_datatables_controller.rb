class Api::V1::I18nDatatablesController < ActionController::Base
  respond_to :json

  def show
    if params[:id] == 'nl'
      translation = { 
        "sProcessing" => "Bezig...",
        "sLengthMenu" => "_MENU_ resultaten weergeven",
        "sZeroRecords" => "Geen resultaten gevonden",
        "sInfo" => "_START_ tot _END_ van _TOTAL_ resultaten",
        "sInfoEmpty" => "Geen resultaten om weer te geven",
        "sInfoFiltered" => " (gefilterd uit _MAX_ resultaten)",
        "sInfoPostFix" => "",
        "sSearch" => "Zoeken:",
        "sEmptyTable" => "Geen resultaten aanwezig in de tabel",
        "sInfoThousands" => ".",
        "sLoadingRecords" => "Een moment geduld aub - bezig met laden...",
        "oPaginate" => {
            "sFirst" => "Eerste",
            "sLast" => "Laatste",
            "sNext" => "Volgende",
            "sPrevious" => "Vorige"
        },
        "oAria" => {
            "sSortAscending" => ": activeer om stijgend te sorteren",
            "sSortDescending" => ": activeer om dalend te sorteren"
        }
      }
    else
      translation = {
        "sEmptyTable" => "No data available in table",
        "sInfo" => "Showing _START_ to _END_ of _TOTAL_ entries",
        "sInfoEmpty" => "Showing 0 to 0 of 0 entries",
        "sInfoFiltered" => "(filtered from _MAX_ total entries)",
        "sInfoPostFix" => "",
        "sInfoThousands" => ",",
        "sLengthMenu" => "Show _MENU_ entries",
        "sLoadingRecords" => "Loading...",
        "sProcessing" => "Processing...",
        "sSearch" => "Search:",
        "sZeroRecords" => "No matching records found",
        "oPaginate" => {
            "sFirst" => "First",
            "sLast" => "Last",
            "sNext" => "Next",
            "sPrevious" => "Previous"
        },
        "oAria" => {
            "sSortAscending" => ": activate to sort column ascending",
            "sSortDescending" => ": activate to sort column descending"
        }
      }      
    end
    respond_with(translation.to_json)
  end
end