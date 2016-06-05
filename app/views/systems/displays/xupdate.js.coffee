<% if @system.valid? %>
window.location.replace '/system'
<% else %>
$('#edit_system_display_settings_modal').replaceWith('<%= j render('form') %>')
<% end %>
