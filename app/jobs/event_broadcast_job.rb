class EventBroadcastJob < ApplicationJob
  queue_as :default

  def perform(event)
    Rails.logger.debug "Event: #{event}"
    ActionCable.server.broadcast 'events_channel', event: event
  end
end
