$('.modal').modal 'hide'
$('body').append '<%= j(modal(render('form'), header: {text: "#{@engine.name} display settings", icon: 'fa-tv'}, id: "edit_engine_#{@engine.name}_display_settings_modal") ) %>'
$("#edit_engine_<%= @engine.id %>_display_settings_modal").modal(backdrop: 'static').modal 'show'
$("#edit_engine_<%= @engine.id %>_display_settings_modal").on 'hidden.bs.modal', ->
  $(this).remove()
  return
