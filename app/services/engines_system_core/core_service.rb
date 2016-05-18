module EnginesSystemCore
  class CoreService

    include Actions
    # include Definitions
    include Inspections
    include Properties
    include CoreResult::ApiCalls

    def initialize(name)
      @name = name
    end
    attr_reader :name

    def api
      @@api ||= (p :LOAD_ENGINE; 10.times{p '$'}; EnginesSystemCore::CoreSystem.load_service name)
    end

  end
end
