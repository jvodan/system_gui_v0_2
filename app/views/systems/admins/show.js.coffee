$('.modal').modal 'hide'
$('body').append("<%= j render('show') %>")
$('#system_admin_user_modal').modal(backdrop: 'static').modal 'show'
$('#system_admin_user_modal').on 'hidden.bs.modal', -> $(this).remove()
