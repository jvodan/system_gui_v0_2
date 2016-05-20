App.events = App.cable.subscriptions.create "EventsChannel",
  connected: ->
    $(document).ready ->
      $('a#server_connection_status').addClass 'system_gui_connected'
      return
    # Called when the subscription is ready for use on the server

  disconnected: ->
    $('a#server_connection_status').removeClass 'system_gui_connected system_core_connected'
    return
    # Called when the subscription has been terminated by the server

  received: (data) ->
    eval(data['event'])

  speak: (data) ->
    @perform 'speak', event: data
