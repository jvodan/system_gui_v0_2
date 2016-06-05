class ContainerEventsListenerJob < ApplicationJob
  queue_as :default

  def perform
    System.instance.container_event_stream do |event|
      broadcast_event system_core_connection_status(:connected)
      unless event == :heartbeat
        broadcast_event update_container_state(event)
      end
    end
    broadcast_event system_core_connection_status(:disconnected)
    Rails.logger.warn :listen_to_container_events_closing
    # rescue StandardError => e
    #   Rails.logger.debug :listen_to_container_events_exception
    #   Rails.logger.debug e.to_s
    #   Rails.logger.debug e.backtrace.to_s
    #   raise
  end

  def system_core_connection_status(status)
    ApplicationController.renderer.render(
      "jobs/system_core_connection_status_#{status}" )
  end

  def update_container_state(event)
    ApplicationController.renderer.render(
      "jobs/update_container_state", locals: { event: event } )
  end

end
