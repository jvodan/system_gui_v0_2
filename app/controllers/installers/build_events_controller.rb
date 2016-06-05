module Installers
  class BuildEventsController < ApplicationController

    include ActionController::Live

    def show
      response.headers['Content-Type'] = 'text/event-stream'

# 10.times {response.stream.write("event: log_line\ndata: test\n\n"); sleep 1}
# response.stream.write("event: log_eof\ndata: true\n\n")


      System.instance.builder_log_stream do |log_line|

p :log_line

response.stream.write("event: log_line\ndata: #{log_line}\n\n")
      end
  response.stream.write("event: log_eof\ndata: true\n\n")
ensure
  response.stream.close

      Rails.logger.warn :show_builder_log_stream_closing
    end

  end
end
