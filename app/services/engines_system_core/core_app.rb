module EnginesSystemCore
  class CoreApp

    # include Actions
    # include Inspections
    # include Properties
    include CoreApi::ApiCall

    def initialize(name)
      @name = name
    end
    attr_reader :name

    def state
      get "containers/engine/#{name}/state", parse: :string
    end

    def web_sites
      []
    end

    def stop
      get "containers/engine/#{name}/stop", parse: :boolean
    end

    def start
      get "containers/engine/#{name}/start", parse: :boolean
    end


    # def engine_api
    #   @app_api ||= (p :LOAD_ENGINE; 10.times{p '$'}; EnginesSystemCore::CoreSystem.new.load_engine name)
    # end
    #
    # def system_api
    #   @system_api ||= CoreSystem.new.system_api
    # end

    # def state
    #   @state ||= core_app.read_state.to_sym
    # end
    #
    # def web_sites
    #   @web_sites ||= core_app.web_sites
    # end

    # def memory

  end
end
