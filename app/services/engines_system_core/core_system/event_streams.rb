module EnginesSystemCore
  class CoreSystem
    module EventStreams

      require 'yajl'

      def container_event_stream
        read_stream(
        "#{Rails.application.config.engines_system_core_url}/containers/events/stream",
        'test_token_arandy') do |event|
          if event == '' || event == "\n"
            yield :heartbeat
          else
            parse_event event do |parsed_event|
              yield parsed_event
            end
          end
        end
      end

      def builder_log_stream
        read_stream(
        "#{Rails.application.config.engines_system_core_url}/engine_builder/follow_stream",
        'test_token_arandy') do |event|
          yield event
        end
        # 3.times do
        #   yield Time.now.to_s
        #   sleep 1
        # end
      end

      private

      def read_stream(url, secret)
        url = URI(url)
        Net::HTTP.start(url.host, url.port) do |http|
          request = Net::HTTP::Get.new(url)
          request['access_token'] = secret
          http.request(request) do |response|
            Rails.logger.debug "Event received: #{response}"
            return if response.is_a?(Net::HTTPNotFound)
            response.read_body do |event|
              begin
                yield event
              rescue StandardError => e
                Rails.logger.debug "Listen for event Error: #{e} #{event}"
                raise
              end
            end
          end
        end
      end

      def parse_event(event)
        Yajl::Parser.new(symbolize_keys: true).parse(event) do |parsed_event|
          yield parsed_event
        end
      end

    end
  end
end
