class SystemEventsListenerJob < ApplicationJob
  queue_as :default

  require 'yajl'


  def perform

      # ActionCable.server.broadcast 'system_events_channel', event: "from job"

  # SystemEventsChannel.new.speak 'hihi'

  # # engines_tool system login user user
    #   Rails.logger.debug "Starting request system event..."
    #   uri = URI('http://127.0.0.1:4567/containers/services/state')
    #   req = Net::HTTP::Get.new(uri)
    #   req['access_token'] = 'test_token_arandy'
    #   res= Net::HTTP.start(uri.hostname, uri.port) do |http|
    #     http.request(req)
    #   end
    #   Rails.logger.debug "response: #{res}"
    #   ActionCable.server.broadcast 'events_channel', event: res.to_s
    #   Rails.logger.debug "done."
    # end


    # def get_json_stream(path)

    # SystemEventsListenerJob.perform_later
    # Rails.logger.debug :start_listen_to_system_events

    # ActionCable.server.broadcast 'events_channel', event: "foo"


    uri = URI('http://127.0.0.1:4567/v0/containers/events/stream')
    Net::HTTP.start(uri.host, uri.port) do |http|
      p :made_a_request

      req = Net::HTTP::Get.new(uri)
      req['access_token'] = 'test_token_arandy'
      parser = Yajl::Parser.new
      http.request(req) do |resp|
        p :got_a_response
        p resp
        return if resp.is_a?(Net::HTTPNotFound)
        broadcast update_system_core_connection_status
        resp.read_body do |chunk|
          begin
            if chunk == '' || chunk == "\n"
              broadcast update_system_core_connection_status
            else
              parser.parse(chunk) do |event|
                broadcast update_container_status(event)
              end
            end
          rescue StandardError => e
            Rails.logger.debug "e: #{e} #{chunk}"
            next
          end
        end
      end
    end
    view_js = update_system_core_connection_status
    ActionCable.server.broadcast 'events_channel', event: "$('a#server_connection_status').removeClass('system_core_connected');"
    Rails.logger.debug :listen_to_system_events_closing
  rescue StandardError => e
    #Should goto to error hanlder but this is a script
    Rails.logger.debug :listen_to_system_events_exception
    Rails.logger.debug e.to_s
    Rails.logger.debug e.backtrace.to_s
  end

  def update_system_core_connection_status
    ApplicationController.renderer.render(
      'jobs/update_system_core_connection_status' )
  end

  def update_container_status(event)
    update_system_core_connection_status +
    ApplicationController.renderer.render(
      'jobs/update_container_status',
      locals: { name: event['container_name'].split(':').first,
                status: event['status'] } )
  end

  def broadcast(view_js)
    ActionCable.server.broadcast 'events_channel', event: view_js
  end


end
