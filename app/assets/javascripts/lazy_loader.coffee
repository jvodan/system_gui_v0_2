# lazy_load_objects = ->
#   $('[data-behavior~=lazy_load]').each ->
#     lazy_load_object this
#     return
#   return
#
# lazy_load_object = (object) ->
#   $.ajax
#     url: $(object).attr('data-url')
#     dataType: 'script'
#   return
#
# $(document).ready ->
#   lazy_load_objects()
#   return
# $(document).on 'turbolinks:render', ->
#   lazy_load_objects()
#   return
