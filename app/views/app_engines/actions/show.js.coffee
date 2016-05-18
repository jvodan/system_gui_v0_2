$("#engine_<%= @engine.id %>_control_panel_modal_flash_messages").html("<%= j(flash_message @action_result[:type], @action_result[:message]) %>");
$("#engine_<%= @engine.id %>_control_panel_modal_flash_messages").hide().fadeIn();
