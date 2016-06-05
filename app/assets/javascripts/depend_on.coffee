bind_depend_on_form_field_events = ->
  $('input').each ->
    $(this).change ->
      check_depend_on_form_fields()
  return

check_depend_on_form_fields = ->
  $('[data-behavior~=depend_on]').each ->
    dependent_field = this
    dependor_input = $('#' + $(dependent_field).data('depend-on-input'))
    check_dependent_field_visibility dependent_field, dependor_input
  return

check_dependent_field_visibility = (dependent_field, dependor_input) ->
  if ( $(dependent_field).data('depend-on-property') == 'checked' and $(dependor_input).prop('checked') ) or $(dependent_field).data('depend-on-value') == $(dependor_input).val()
    if $(dependent_field).data('depend-on-display') == 'hide'
      $(dependent_field).hide()
    else
      $(dependent_field).show()
  else
    if $(dependent_field).data('depend-on-display') == 'hide'
      $(dependent_field).show()
    else
      $(dependent_field).hide()
  return

# dependor_input_for = (dependent_field) ->
#   $ '#' + $(dependent_field).data('depend-on-input')
#   return

#
#     $('[data-behavior~=depend_on]').on 'click' ->
#
#
#
#     $('#')'<div class="alert alert-info alert-dismissible"><button name="button" type="button" class="close" data-dismiss="alert">×</button>' + $(this).attr('data') + '</div>'
#   return
# return

process_depends_on = ->
  bind_depend_on_form_field_events()
  check_depend_on_form_fields()
  return

$(document).ready -> process_depends_on()
$(document).on 'turbolinks:render', -> process_depends_on()
$(document).ajaxComplete -> process_depends_on()
