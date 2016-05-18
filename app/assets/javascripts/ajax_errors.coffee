$(document).ajaxError (event, request, settings) ->
  alert(request.responseText)
  location.reload()
  return
