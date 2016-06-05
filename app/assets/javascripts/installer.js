$(document).ready(function(){
  $('[data-behavior~=stream_builder_log]').each(function() {
    if ($("#installer_builder_log").html() == '') {
    // alert($(this).data('builder-log-url'));
      var builder_log_event_source = new EventSource($(this).data('builder-log-url'));





      builder_log_event_source.addEventListener("log_line", process_builder_log_line);
      builder_log_event_source.addEventListener("log_eof", process_builder_log_eof);
    //
    //
    //
    // var dependent_field, dependor_input;
    // dependent_field = this;
    // return dependor_input = $('#' + $(dependent_field).data('depend-on-input'));
    };
  });

  // if ($("#installer_builder_log").html() == '') {
  //   $("#installer_builder_log").html('Starting installation.');
  // };

});

function process_builder_log_line(e) {
  new_line = e.data;
  // var new_html = ansi_up.ansi_to_html(new_line);
  // $("#installation_progress").prepend(new_html + '\n');
  $("#installer_builder_log").prepend(new_line + '\n');
};

function process_builder_log_eof(e) {
  this.close();
};








if (false) {
	if ($("#installation_statusxxxxxx").length > 0) {
		if ($("#installation_progress").html() == '') {
			$("#installation_progress").html('Starting installation.');
			var asciiart = "  ______                   _                      \n |  ____|                 (_)                     \n | |__     _ __     __ _   _   _ __     ___   ___ \n |  __|   | '_ \\   / _` | | | | '_ \\   / _ \\ / __|\n | |____  | | | | | (_| | | | | | | | |  __/ \\__ \\\n |______| |_| |_|  \\__, | |_| |_| |_|  \\___| |___/\n                    __/ |                         \n                   |___/\n\n";
			$("#installation_report").html(asciiart + '       Waiting for installation to complete.');
			var progress_path = $("#installation_status").data("progresspath");
			var evtSource = new EventSource(progress_path);
			var build_progress_log_result_message = '';
			var new_line;

			var progress_listener = function(e) {
				new_line = e.data;
				if (new_line.substring(0, 13) == "Build Result:") {
					build_progress_log_result_message = new_line.substring(13);
				};
				if (new_line.substring(0, 15) == "Cancelable:true") {
					$("#installation_cancel_button").slideDown();
					return;
				};
				if (new_line.substring(0, 15) == "Cancelable:false") {
					$("#installation_cancel_button").slideUp();
					return;
				};
				var new_html = ansi_up.ansi_to_html(new_line);
				$("#installation_progress").prepend(new_html + '\n');
			};

			var report_listener = function(e) {
				new_line = e.data;
				if ($("#installation_report").html().indexOf("Waiting for installation to complete.") > -1 ) {
					$("#installation_report").html('');
				};
				var html = ansi_up.ansi_to_html(new_line);
				$("#installation_report").append(html + '<br>');
			};

			var complete_listener = function(e) {
				if ($("#installation_report").html().indexOf("Waiting for installation to complete.") > -1 ) {
					$("#installation_report").html('No report');
				};
				if (e.data == 'done') {
					var flash_message = build_progress_log_result_message;
					evtSource.close();
					$("#installation_done_button").slideDown();
					$("#installation_cancel_button").hide();
					$("#report_tab_buttons").show();
					$("#installation_report_tab_button").click();
					if (build_progress_log_result_message.substring(0, 5) == "Error") {
						var flash_alert_class = 'danger';
					} else {
						var flash_alert_class = 'success';
					};
					var flash_message_data_html = '<div class="hidden flash_message_data" data-alertclass="' + flash_alert_class + '" >' + flash_message + '</div>';
					$("body").append(flash_message_data_html);
					do_flash_messages();
				};
			};

			$("#installation_cancel_button").click(
				function () {
					evtSource.close();
					window.location.href = "/application_installation/cancel"
				}
			);

			evtSource.addEventListener("installation_report", report_listener);
			evtSource.addEventListener("installation_progress", progress_listener);
			evtSource.addEventListener("message", complete_listener);
			evtSource.addEventListener("error", function(e) {
				evtSource.close();
				alert('Connection closed. Try reloading the page.');
			});
		};
	};

};
