jQuery ->
  models = $('#asset_model_id').html()
  $('#asset_make_id').change ->
    make = $('asset_make_id :selected').text()
    options = $(models).filter("optgroup[label='#{make}']").html()
    if options
      $('#asset_make_id').html(options)
    else
      $('#asset_make_id').empty()