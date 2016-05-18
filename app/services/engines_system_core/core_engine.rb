module EnginesSystemCore
  class CoreEngine

    include Actions
    include Inspections
    include Properties
    include CoreResult::ApiCalls

    def initialize(name)
      @name = name
    end
    attr_reader :name

    def engine_api
      @engine_api ||= (p :LOAD_ENGINE; 10.times{p '$'}; EnginesSystemCore::CoreSystem.new.load_engine name)
    end

    def system_api
      @system_api ||= CoreSystem.new.system_api
    end

    # def state
    #   @state ||= core_engine.read_state.to_sym
    # end
    #
    # def web_sites
    #   @web_sites ||= core_engine.web_sites
    # end

    # def memory

  end
end
