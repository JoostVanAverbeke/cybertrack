# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  api_v1_i18n_datatables_path = $('#patients').data('i18ndatatablespath')

  $('#patients').dataTable
    sPaginationType: "full_numbers"
# Sort only on column 0, column 1 and column 2 disable sorting on column 3    
    aoColumns: [
        null
      , 
        null
      ,  
        null
#      ,
#        bSortable: false,
#        sClass: "myClass"
#      ,
#        bSortable: false,
#        sClass: "myClass"
#      ,
#        bSortable: false,
#        sClass: "myClass"
#      ,
#        bSortable: false
#        sClass: "anchorButton"
#      ,
#        bSortable: false
#        sClass: "myClass"
#      ,
#        bSortable: false
#        sClass: "myClass"
    ]
    oLanguage:
      sUrl: api_v1_i18n_datatables_path    
    bJQueryUI: true
    bProcessing: true
    bServerSide: true
    sAjaxSource: $('#patients').data('source')