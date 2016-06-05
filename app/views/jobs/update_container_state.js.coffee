<%
  container_type = ( event[:container_type] == 'service' ? 'service' : 'app' )
  name = event[:container_name]
  state = event[:state]
  result_message = { type: :success, message: "The #{container_type} #{event[:container_name]} is now #{event[:state]}." }
%>

# timeout is to give a chance for any previous flash messages to finish rendering (after .fadeIn)
setTimeout (->
  $('.<%= container_type %>_<%= name %>_state_indicator').html '<%= state_indicator_for state %>'
  $('.<%= container_type %>_<%= name %>_state_label').html '<%= state.humanize %>'
  $('#<%= container_type %>_<%= name %>_control_panel_modal_flash_messages').html '<%= j(flash_message result_message[:type], result_message[:message]) %>'
  $('#<%= container_type %>_<%= name %>_control_panel_modal_flash_messages').hide().fadeIn()
  return
), 1000
