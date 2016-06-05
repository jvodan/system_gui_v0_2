$('.modal').modal 'hide'
$('body').append '<%= j(render 'index') %>'
$('#system_libraries_modal').modal(backdrop: 'static').modal 'show'
$('#system_libraries_modal').on 'hidden.bs.modal', -> $(this).remove()
