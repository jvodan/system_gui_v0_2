$('.modal').modal 'hide'
$('body').append '<%= j(modal(render('form'), header: {text: 'System display settings', icon: 'fa-tv'}, id: 'edit_system_display_settings_modal') ) %>'
$('#edit_system_display_settings_modal').modal(backdrop: 'static').modal 'show'
$('#edit_system_display_settings_modal').on 'hidden.bs.modal', -> $(this).remove()
