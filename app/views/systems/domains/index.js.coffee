$('.modal').modal 'hide'
$('body').append '<%= j(render 'index') %>'
$('#system_domains_modal').modal(backdrop: 'static').modal 'show'
$('#system_domains_modal').on 'hidden.bs.modal', -> $(this).remove()
