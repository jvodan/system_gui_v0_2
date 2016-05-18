# hide_file_field_exisitng_image = (select_field) ->
#   $(select_field).parent().next().children().first().hide()
#   return
#
# show_file_field_exisitng_image = (select_field) ->
#   $(select_field).parent().next().children().first().show()
#   return
#
# hide_file_field_uploader = (select_field) ->
#   $(select_field).parent().next().children().first().next().next().hide()
#   return
#
# show_file_field_uploader = (select_field) ->
#   $(select_field).parent().next().children().first().next().next().show()
#   return
#
# check_file_field_selector = (select_field) ->
#   value = $(select_field).val()
#   if value == 'existing'
#     show_file_field_exisitng_image select_field
#     hide_file_field_uploader select_field
#   else if value == 'upload'
#     hide_file_field_exisitng_image select_field
#     show_file_field_uploader select_field
#   else
#     hide_file_field_exisitng_image select_field
#     hide_file_field_uploader select_field
#   return
#
# check_file_field_selectors = ->
#   $('.file_field_update_action_select').each ->
#     check_file_field_selector this
#     return
#   return
# 
# bind_file_field_select_action = ->
#   $('.file_field_update_action_select').on 'change', ->
#     # alert $(this).val()
#     check_file_field_selector this
#     return
#   return
#
# $(document).on 'turbolinks:render', ->
#   check_file_field_selectors()
#   bind_file_field_select_action()
#   return
# $(document).ready ->
#   check_file_field_selectors()
#   bind_file_field_select_action()
#   return
