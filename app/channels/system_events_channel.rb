# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class SystemEventsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "system_events_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    ActionCable.server.broadcast 'system_events_channel', message: data['message']
  end
end
