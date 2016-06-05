$('.modal').modal 'hide'
$('body').append '<%= j(modal(render("form"), header: {text: "#{@app.name} display settings", icon: "fa-tv"}, id: "edit_app_#{@app.name}_display_settings_modal") ) %>'
$("#edit_app_<%= @app.name %>_display_settings_modal").modal(backdrop: 'static').modal 'show'
$("#edit_app_<%= @app.name %>_display_settings_modal").on 'hidden.bs.modal', ->
  $(this).remove()
  return
