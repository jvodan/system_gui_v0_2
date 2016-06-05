class EventBroadcastJob < ApplicationJob
  queue_as :default

  def perform(event)
    p "Event: #{event}"
    ActionCable.server.broadcast 'events_channel', event: event
  end
end
