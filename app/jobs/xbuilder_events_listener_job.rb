# class BuilderEventsListenerJob < ApplicationJob
#   queue_as :default
#
#   def perform
#     listen_for_events(
#       "#{Rails.application.config.engines_system_core_url}/engine_builder/follow_stream",
#       'test_token_arandy') do |event|
#         # parse_event event do |parsed_event|
#           broadcast_event update_builder_live_log(event)
#         # end
#       end
#       Rails.logger.warn :listen_to_builder_events_closing
#     # rescue StandardError => e
#     #   Rails.logger.debug :listen_to_builder_events_exception
#     #   Rails.logger.debug e.to_s
#     #   Rails.logger.debug e.backtrace.to_s
#     #   raise
#   end
#
#   def update_builder_live_log(event)
#     ApplicationController.renderer.render(
#       "jobs/update_builder_live_log", locals: {event: event} )
#   end
#
#
#   def monitor_builder_events
#     # Thread.new do
#       # loop do
#         Rails.logger.warn 'Open connection to Engines builder events.'
#         BuilderEventsListenerJob.perform_now
#         Rails.logger.warn 'Close connection to Engines builder events.'
#         # sleep 1
#       # end
#     # end
#   end
#
#
# end
