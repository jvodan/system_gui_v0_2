<% if display_settings.valid? %>
window.location.replace '/system'
<% else %>
$('#edit_system_settings_display').replaceWith('<%= j render('form') %>')
<% end %>
