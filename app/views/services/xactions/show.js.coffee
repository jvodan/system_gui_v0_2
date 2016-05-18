$("#modal_flash_messages").html("<%= j(flash_message @action_result[:result_type], @action_result[:message]) %>");
$("#modal_flash_messages").hide().fadeIn();
