class System
  module EventStreams

    def container_event_stream(&block)
      core_system.container_event_stream(&block)
    end

    def builder_log_stream(&block)
      core_system.builder_log_stream(&block)
    end

  end
end
