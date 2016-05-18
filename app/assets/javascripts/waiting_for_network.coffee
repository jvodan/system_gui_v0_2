bind_http_network_action_click_event = \
-> $('.http_network_action').click -> show_waiting_for_network()

show_waiting_for_network = -> $('#waiting_for_network').fadeIn 1000
hide_waiting_for_network = -> $('#waiting_for_network').fadeOut 50

$(document).ajaxStart -> show_waiting_for_network()
$(document).ajaxStop -> hide_waiting_for_network()
$(document).ready ->
  bind_http_network_action_click_event()
  hide_waiting_for_network()
  return
$(document).on 'turbolinks:render', ->
  bind_http_network_action_click_event()
  hide_waiting_for_network()
  return
# $(window).location.on 'change', ->
$(window).unload ->
  hide_waiting_for_network()
  return
