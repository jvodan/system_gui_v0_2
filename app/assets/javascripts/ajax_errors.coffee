$(document).ajaxError (event, request, settings) ->
  response = request.responseText
  if typeof response != 'undefined'
    alert(response)
    location.reload()
    return
