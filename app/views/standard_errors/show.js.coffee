$('.modal').modal 'hide';
$("#flash_messages").html("<%= j(flash_message :alert, error) %>");
