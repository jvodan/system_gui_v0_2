# < %
#   container_type = ( event[:container_type] == 'service' ? 'service' : 'app' )
#   name = event[:container_name],
#   state = event[:state],
#   type = container_type,
#   result_message = { type: :success, message: "The #{container_type} #{event[:container_name]} is now #{event[:state]}." } } )
# %>
#
# # timeout is to give a chance for any previous flash messages to finish rendering (after .fadeIn)
# setTimeout (->
#   $('.< %= type %>_< %= name %>_state_indicator').html '< %= state_indicator_for state %>'
#   $('.< %= type %>_< %= name %>_state_label').html '< %= state.humanize %>'
#   $('#< %= type %>_< %= name %>_control_panel_modal_flash_messages').html '< %= j(flash_message result_message[:type], result_message[:message]) %>'
#   $('#< %= type %>_< %= name %>_control_panel_modal_flash_messages').hide().fadeIn()
#   return
# ), 1000
$('.installer_app_build_log_stream').prepend event
